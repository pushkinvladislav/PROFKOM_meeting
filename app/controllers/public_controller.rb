class PublicController < ApplicationController

  def main
    @events = Event.active
  end

end
