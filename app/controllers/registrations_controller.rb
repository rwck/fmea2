## added by DRW - this is supposed to let a user update their account without entering a password

class RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
