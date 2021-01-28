class ApplicationController < ActionController::Base
    include Pundit
    protect_from_forgery with: :exception
    rescue_from Pundit::NotAuthorizedError, with: :pundit_error
    before_action :configuration_of_params, if: :devise_controller?

    private

    def pundit_error
        flash[:notice] = 'no access'
        redirect_to root_path
    end

    def configuration_of_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

end
