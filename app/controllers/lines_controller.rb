class LinesController < ApplicationController
  before_action :authenticate!
  before_action :set_story
  before_action :set_chapter
  before_action :set_line, except: [:new, :create]

  def new
    @line = Line.new
    respond_with(@line)
  end

  def create
    @line = Line.new(line_params.merge({ chapter: @chapter }))
    if @line.save
      # active record
      @option = Option.create(option_params.merge({ line: @line }))
      respond_with(@line, location: -> { story_chapter_path(@story, @chapter) })
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
      params.require(:line).permit(
        :id,
     		:order,
     		:line_type,
     		:emotion,
        :text,
        :speakeable_id,
      )
    end

    def option_params
      params[:option] = {}
      params[:option][:answers] = Answers::BuildAnswers.execute(params: params[:line][:option]).answers
      params[:option][:weights] = Answers::BuildWeights.execute(params: params[:line][:option]).weights

      params.require(:option).permit(
        weights: [],
        answers: [],
      )
    end
end
