class CharactersController < ApplicationController
  before_action :authenticate!
  before_action :set_character, except: [:index, :new, :create]

  def index
    @characters = current_user.characters
    page = params[:page] || 1

    @characters = @characters
      .page(page)
      .per(10)
  end

  def new
    @character = Character.new
    respond_with(@character)
  end

  def create
    @character = Character.new(character_params.merge({ user: current_user }))
    if @character.save
      respond_with(@character, location: -> { characters_path })
    else
      render :new
    end
  end

  def show
  end

  def update
    @character.update_attributes(character_params.merge({ user: current_user }))
    if @character.save
      respond_with(@character, location: -> { characters_path })
    else
      render :edit
    end
  end

  def edit
  end

  private
    def set_character
      @character = Character.find(params[:id])
    end

    def character_params
      params[:character][:details] = Characters::BuildDetails.execute(params: params[:character]).details
      params[:character][:emotions] = Characters::BuildEmotions.execute(params: params[:character]).emotions

      params.require(:character).permit(
        :id,
        :biography,
        :name,
        details: {},
        emotions: {},
      )
    end
end
