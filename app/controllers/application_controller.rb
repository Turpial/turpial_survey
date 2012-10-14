class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
 
def set_locale
  locale = params[:lang] == 'en' ? 'en' : 'es'  
  I18n.locale = locale
end


end
