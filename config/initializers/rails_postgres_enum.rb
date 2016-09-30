module ActiveRecord
  class SchemaDumper
    def dump(stream)
      header(stream)
      extensions(stream)
      enums(stream)
      tables(stream)
      trailer(stream)
      stream
    end

    private
      def enums(stream)
        enum_types = @connection.enum_types
        if enum_types.any?
          stream.puts "  # These are custom enum types that must be created before they can be used in the schema definition"
          enum_types.each do |enum_type|
            stream.puts "  create_enum :#{enum_type.first}, :#{enum_type.second.join(', :')}"
          end
          stream.puts
        end
        stream.puts
      end
  end

  module ConnectionAdapters
    class PostgreSQLAdapter
      def native_database_types
        NATIVE_DATABASE_TYPES.merge(enum: { name: "enum" })
      end

      def column_spec(column)
        spec = prepare_column_options(column)
        (spec.keys - [:name, :type, :enum_type]).each{ |k| spec[k].insert(0, "#{k}: ")}

        if column.type == :enum
          spec[:name] = [column.name.inspect, spec[:enum_type]].join(', :')
        else
          spec[:name] = column.name.inspect
        end

        spec[:type]      = column.type == :enum ? 'column' : schema_type(column).to_s
        spec.delete(:enum_type)
        spec
      end

      def prepare_column_options(column)
        spec = super
        spec[:enum_type] = column.sql_type if column.type == :enum
        spec[:array]     = 'true' if column.respond_to?(:array) && column.array
        spec[:default]   = "\"#{column.default_function}\"" if column.default_function
        spec
      end

      def migration_keys
        super.insert(1, :enum_type) << :array
      end

      def enum_types
        query = <<-SQL
          SELECT t.typname AS enum_name,
                 string_agg(e.enumlabel, ' ') AS enum_value
          FROM pg_type t
          JOIN pg_enum e ON t.oid = e.enumtypid
          JOIN pg_catalog.pg_namespace n ON n.oid = t.typnamespace
          WHERE n.nspname = 'public'
          GROUP BY enum_name
        SQL
        res =  exec_query(query, 'SCHEMA').cast_values
        res.each do |line|
          line[1] = line[1].split(' ')
        end
        res
      end
    end

    module PostgreSQL::SchemaStatements
      def create_enum(name, *values)
        execute "CREATE TYPE #{name} AS ENUM (#{values.map{|v| "'#{v}'"}.join(', ')})"
      end

      def drop_enum(name)
        execute "DROP TYPE #{name}"
      end
    end
  end
end
