class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def main
    @properties = Property.with_attached_property_images.all
  end

  def show
    render template: "pages/#{params[:page]}"
  end
end
