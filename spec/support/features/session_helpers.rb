module Features
  module SessionHelpers
    def sign_up_with(user)
      fill_form(:user, user, attributes_for(:user).slice(*sign_up_attributes))
      click_button 'Sign up'
    end

    def sign_up_attributes
      [:name, :email, :password]
    end

    def sign_in(user)
      # fill_form(:user, user, attributes_for(:user).slice(*sign_in_attributes))
      fill_in "user[email]", with: user.email
      fill_in "user[password]", with: user.password
      click_button "Log in"
    end
  end
end
