class RegistrationsController < Devise::RegistrationsController
  def create
    if verify_recaptcha
      super
  end
end