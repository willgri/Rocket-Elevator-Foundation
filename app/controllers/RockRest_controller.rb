class RockRestController < ApplicationController
    before_action :authenticate_admin!   
end
