class IntertitlesController < ApplicationController
  before_action :require_login, except: [:index, :show]

  # GET /intertitles
  # GET /intertitles.json
  def index
    @intertitles = Intertitle.all
    # @intertitles = Intertitle.all.shuffle.take(20)
  end

  # GET /intertitles/1
  # GET /intertitles/1.json
  def show
    @intertitle = Intertitle.find(params[:id])
    @split_intertitle = @intertitle.content.split("\n")
  end

  # GET /intertitles/new
  def new
    @intertitle = Intertitle.new
  end

  # GET /intertitles/1/edit
  def edit
    @intertitle = Intertitle.find(params[:id])
  end

  # POST /intertitles
  # POST /intertitles.json
  def create
    @intertitle = Intertitle.new(intertitle_params)

    respond_to do |format|
      if @intertitle.save
        format.html { redirect_to @intertitle, notice: 'Intertitle was successfully created.' }
        format.json { render :show, status: :created, location: @intertitle }
      else
        format.html { render :new }
        format.json { render json: @intertitle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intertitles/1
  # PATCH/PUT /intertitles/1.json
  def update
    @intertitle = Intertitle.find(params[:id])
    respond_to do |format|
      if @intertitle.update(intertitle_params)
        format.html { redirect_to @intertitle, notice: 'Intertitle was successfully updated.' }
        format.json { render :show, status: :ok, location: @intertitle }
      else
        format.html { render :edit }
        format.json { render json: @intertitle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intertitles/1
  # DELETE /intertitles/1.json
  def destroy
    @intertitle = Intertitle.find(params[:id])
    @intertitle.destroy
    respond_to do |format|
      format.html { redirect_to intertitles_url, notice: 'Intertitle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_all
    @intertitles = Intertitle.all
  end
  
  # def show_one
  #   @intertitle = Intertitle.find(params[:id])
  # end
  
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def intertitle_params
      params.require(:intertitle).permit(:title, :content)
    end
end
