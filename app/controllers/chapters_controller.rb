class ChaptersController < ApplicationController
  before_action :authenticate!
  before_action :set_story
  before_action :set_chapter, except: [:index, :new, :create]

  def index
    page = params[:page] || 1
    @chapters = @story.chapters.order(:order_number)

    @chapters = @chapters
      .page(page)
      .per(10)
  end

  def new
    @chapter = Chapter.new
    respond_with(@chapter)
  end

  def create
    @chapter = Chapter.new(chapter_params.merge({ story: @story }))

    order_number = Chapters::BuildOrder.execute(story: @story, chapter: @chapter).order_number
    @chapter.update_attributes(order_number: order_number)

    if @chapter.save
      respond_with(@chapter, location: -> { story_chapters_path })
    else
      render :new
    end
  end

  def show
    @lines = @chapter.lines.includes(:option).order(:order)
    page = params[:page] || 1

    @lines = @lines
      .page(page)
      .per(20)
  end

  def update
    # add order number job
    if @chapter.update(chapter_params)
      respond_with(@chapter, location: -> { story_chapters_path })
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
  end

  def new_ending
  end

  private
    def set_story
      @story = Story.find(params[:story_id])
    end

    def set_chapter
      @chapter = @story.chapters.find(params[:id])
    end

    def chapter_params
      if params[:chapter][:order_number].present?
        params[:chapter][:order_number] = params[:chapter][:order_number].to_i
      end

      params.require(:chapter).permit(
        :status,
        :chap_type,
        :title,
      )
    end
end
