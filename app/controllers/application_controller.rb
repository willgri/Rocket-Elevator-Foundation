class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    # def create
    #     @quotes = quotes.new(params[:Fullname])
    #     if @quotes.save
    #       redirect_to @quotes
    #     else
    #         render "new"
    #     end
    # end
end
