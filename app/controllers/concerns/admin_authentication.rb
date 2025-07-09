module AdminAuthentication
  extend ActiveSupport::Concern

  included do
    before_action :admin_authenticate
  end

  private
    def admin_authenticate
      if cookies.encrypted[:admin_id] == "ferino"
        Current.admin = true
      else
        redirect_to login_admin_url
      end
    end

    def login_admin(password)
      cookies.encrypted[:admin_id] = password
    end
end