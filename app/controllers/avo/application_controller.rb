module Avo
  class ApplicationController < BaseApplicationController
    include Authentication

    prepend_before_action :require_authentication

    before_action :authorize_admin

    delegate :new_session_path, to: :main_app

    private

    def authorize_admin
      redirect_to main_app.root_path unless Current.user&.staff?
    end


    # include CurrentUser
  end
end
