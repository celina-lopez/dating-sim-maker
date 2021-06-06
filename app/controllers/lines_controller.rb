class LinesController < ApplicationController
  before_action :authenticate!
  before_action :set_story
  before_action :set_chapter
  before_action :set_lines, except: [:new, :create]

  def new
    @line = Line.new
    respond_with(@line)
  end

  def create
    @line = Line.new(line_params.merge({ chapter: @chapter }))
    if @line.save
      respond_with(@line, location: -> { story_chapter_lines_path })
    else
      render :new
    end
  end

  def show
  end

  def update
    # add order number job
    if @line.update(line_params)
      respond_with(@line, location: -> { story_chapter_lines_path })
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
  end

  private
    def set_story
      @story = Story.find(params[:story_id])
    end

    def set_chapter
      @chapter = @story.chapters.find(params[:chapter_id])
    end

    def set_line
      @line = @chapter.lines.find(params[:id])
    end

    def line_params
      params.require(:chapter).permit(
        :id,
     		:order_number,
     		:status,
     		:chap_type,
     		:title,
      )
    end
end
