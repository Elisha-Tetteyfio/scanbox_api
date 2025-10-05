class ApplicationController < ActionController::API
  include ActionController::Cookies 
  include JsonWebToken
end
