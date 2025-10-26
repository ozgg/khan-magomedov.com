# frozen_string_literal: true

class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[new create]
  rate_limit to: 10, within: 3.minutes, only: :create, with: lambda {
    redirect_to new_session_path, alert: t('sessions.rate_limit_hit')
  }

  # get /session/new
  def new; end

  # post /session
  def create
    if (user = User.authenticate_by(params.permit(:slug, :password)))
      start_new_session_for user
      redirect_to after_authentication_url
    else
      redirect_to new_session_path, alert: t('.failed')
    end
  end

  # delete /session
  def destroy
    terminate_session
    redirect_to new_session_path, status: :see_other
  end
end
