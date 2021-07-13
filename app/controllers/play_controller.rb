class PlayController < ApplicationController
  before_action :authenticate!
  # before_action :set_story

  def show
  end

  def asset	
  end

  private
    def set_story
      @story = Story.find(params[:id])
    end
end
