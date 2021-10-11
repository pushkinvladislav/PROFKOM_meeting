# frozen_string_literal: true

class PublicController < ApplicationController



  def main
    @events = Event.active
    @preview_events = Event.preview
  end
end
