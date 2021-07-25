class HomeController < ApplicationController
    skip_before_action :logged_in_user, only: :index
    def index
    end
end