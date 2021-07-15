class LinesController < ApplicationController
  before_action :authenticate!
  before_action :set_story
  before_action :set_chapter
  before_action :set_line, except: [:new, :create, :index]
# bulk update for line ordering
  
  def index
    @lines = @chapter.lines.includes(:option).order(:order)
    page = params[:page] || 1

    @lines = @lines
      .page(page)
      .per(20)
  end

  def new
    @line = Line.new
    respond_with(@line)
  end

  def create
    @line = Line.new(line_params.merge({ chapter: @chapter }))

    order_number = Lines::BuildOrder.execute(chapter: @chapter, line: @line).order_number
    @line.update_attributes(order: order_number)

    ActiveRecord::Base.transaction do
      @line.save!
      if option_params.select{ |k, v| v.present? }.present?
        @option = Option.create(option_params.merge({ line: @line }))
      end
      respond_with(@line, location: -> { story_chapter_lines_path(@story, @chapter) })
    end
  rescue
    redirect_to new_story_chapter_line_path(@story, @chapter, Line.new), alert: "Failed to save line"
  end

  def update
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
