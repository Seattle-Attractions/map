class StaticPagesController < ApplicationController
  skip_before_action :authenticate_admin!
end
