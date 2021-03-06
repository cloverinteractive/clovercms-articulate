# Everything in this class is a stub and not part of this gem, its just added
# here merely for testing in the browser.

class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale
  rescue_from Acl9::AccessDenied, :with => :roles_notice

  def current_user
    @current_user ||= User.find_or_initialize_by_username( params[:username] || 'admin' )
    @current_user.save if @current_user.new_record?
    @current_user.has_role!( params[:role] || 'admin' )

    @current_user
  end

  def authenticate_user!
    true
  end

  def roles_notice
    notice = <<-END_NOTICE
    You just raised an Acl9::AccessDenied exception, you must have tried an invalid role,
    try setting the role in the query string like: ?role=admin or set no role at all to
    get back to the page you intended to go.
    END_NOTICE

    render :text =>  notice, :status => 403
  end

  private
  def set_locale
    I18n.locale = params[:locale] || 'en'
  end
end
