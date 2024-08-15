class UrlsController < ApplicationController
  before_action :set_url, only: %i[ show create destroy ]

  # GET /urls or /urls.json
  def index
    @urls = Url.by_counter

    render json: { message: "URLs found",  urls: @urls }, status: :ok
  end

  # GET /urls/1 or /urls/1.json
  def show
    render json: { message: "URL does not exist yet" }, status: :unprocessable_entity and return if @url.nil?

    @url.increase_counter
    @url.save

    render json: { message: "URL found",  url: @url }, status: :ok
  end

  # GET /urls/new
  # def new
  #   @url = Url.new
  # end

  # GET /urls/1/edit
  # def edit
  # end

  # POST /urls or /urls.json
  def create
    @url = Url.find_or_initialize_by(url_params)

    if @url.save
      render json: { message: "URL created",  url: @url }, status: :ok
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /urls/1 or /urls/1.json
  # def update
  #   respond_to do |format|
  #     if @url.update(url_params)
  #       format.html { redirect_to url_url(@url), notice: "Url was successfully updated." }
  #       format.json { render :show, status: :ok, location: @url }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @url.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /urls/1 or /urls/1.json
  def destroy
    @url.destroy!

    respond_to do |format|
      format.html { redirect_to urls_url, notice: "Url was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find_by_id(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def url_params
      params.require(:url).permit(:original_url, :shortened_url, :title_url, :counter)
    end
end
