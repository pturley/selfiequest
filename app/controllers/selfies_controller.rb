class SelfiesController < ApplicationController
  before_action :set_quest
  before_action :authenticate_quest_for_user!
  before_action :set_selfie, only: [:show, :edit, :update, :destroy]

  def index
    @selfies = @quest.selfies
  end

  def show
  end

  def new
    @selfie = Selfie.new
  end

  def edit
  end

  def create
    @selfie = Selfie.new(selfie_params)

    respond_to do |format|
      if @selfie.save
        format.html { redirect_to [@quest, @selfie], notice: 'Selfie was successfully created.' }
        format.json { render action: 'show', status: :created, location: @selfie }
      else
        format.html { render action: 'new' }
        format.json { render json: @selfie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @selfie.update(selfie_params)
        format.html { redirect_to [@quest, @selfie], notice: 'Selfie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @selfie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @selfie.destroy
    respond_to do |format|
      format.html { redirect_to quest_selfies_url(@quest) }
      format.json { head :no_content }
    end
  end

  private
    def set_quest
      @quest = Quest.find(params[:quest_id])
    end

    def set_selfie
      @selfie = Selfie.find(params[:id])
    end

    def selfie_params
      params.require(:selfie).permit(:image, :quest_id)
    end
end
