class DownloadsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:create]
  before_action :set_download, only: [:show, :edit, :update, :destroy]

  # GET /downloads
  # GET /downloads.json
  def index
    @downloads = Download.all
  end

  # GET /downloads/1
  # GET /downloads/1.json
  def show
  end

  # GET /downloads/new
  def new
    @download = Download.new
  end

  # GET /downloads/1/edit
  def edit
  end

  def thirtyfive_p1
      if Download.exists?(email: params[:webpage][:email])
        s3 = AWS::S3.new(access_key_id: ENV['AWS_ACCESS_KEY_ID'], secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'] )
        downobject = s3.buckets['catchframe'].objects['kjahsdf/untitled.zip']
        @tempurl = downobject.url_for(:read, { expires: 10.days.from_now, acl: :authenticated_read }).to_s
      else
        render :js => "alert('Oops, incorrect Email address, maybe a typo?');"
      end
  end

  def thirtyfive_p2
      if Download.exists?(email: params[:webpage][:email])
        render :js => "window.location.href = 'https://s3.amazonaws.com/cinegrain/untitled.zip';"
      else
        render :js => "alert('Oops, incorrect Email address, maybe a typo?');"
      end
  end

  def thirtyfive_p3
      if Download.exists?(email: params[:webpage][:email])
        render :js => "window.location.href = 'https://s3.amazonaws.com/cinegrain/untitled.zip';"
      else
        render :js => "alert('Oops, incorrect Email address, maybe a typo?');"
      end
  end

  def sixteen
      if Download.exists?(email: params[:webpage][:email])
        render :js => "window.location.href = 'https://s3.amazonaws.com/cinegrain/images/CineHeaderRoundedEdges.png';"
      else
        render :js => "alert('Oops, incorrect Email address, maybe a typo?');"
      end
  end

  def eight
      if Download.exists?(email: params[:webpage][:email])
        render :js => "window.location.href = 'https://s3.amazonaws.com/cinegrain/images/CineHeaderRoundedEdges.png';"
      else
        render :js => "alert('Oops, incorrect Email address, maybe a typo?');"
      end
  end

  def grain
      if Download.exists?(email: params[:webpage][:email])
        render :js => "window.location.href = 'https://s3.amazonaws.com/cinegrain/images/CineHeaderRoundedEdges.png';"
      else
        render :js => "alert('Oops, incorrect Email address, maybe a typo?');"
      end
  end

  def artifacts
      if Download.exists?(email: params[:webpage][:email])
        render :js => "window.location.href = 'https://s3.amazonaws.com/cinegrain/images/CineHeaderRoundedEdges.png';"
      else
        render :js => "alert('Oops, incorrect Email address, maybe a typo?');"
      end
  end

  def create
    @ip = request.remote_ip
    params[:webpage][:ip] = @ip
    @download = Download.create(webpage_params)
    respond_to do |format|
      if @download.save
        format.js
      end
    end
  end

  # PATCH/PUT /downloads/1
  # PATCH/PUT /downloads/1.json
  def update
    respond_to do |format|
      if @download.update(download_params)
        format.html { redirect_to @download, notice: 'Download was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @download.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /downloads/1
  # DELETE /downloads/1.json
  def destroy
    @download.destroy
    respond_to do |format|
      format.html { redirect_to downloads_url }
      format.json { head :no_content }
    end
  end

  private
    def set_ip
      webpage_params[:id] = request.remote_ip 
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_download
      @download = Download.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def download_params
      params.require(:download).permit(:name, :email, :count, :ip)
    end

    def webpage_params
      params.require(:webpage).permit(:name, :email, :count, :ip)
    end

end
