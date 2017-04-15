class HomeController < ApplicationController
  def home
   @links = Link.all
  end
end
