# frozen_string_literal: true

class HelloWorldController < ApplicationController
  layout "story"

  def index
    @hello_world_props = { name: "Stranger" }
  end
end
