class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :null_session
  #respond_to :json

def index
  render 'welcome/index'
end

def instagram
  tag = params[:tag]
  accTkn = params[:access_token]

  urlCount = 'https://api.instagram.com/v1/tags/' << tag << '?access_token=' << accTkn
  urlImg = 'https://api.instagram.com/v1/tags/' << tag << '/media/recent?access_token=' << accTkn

  responseCount = HTTParty.get(urlCount)
  dataCunt = responseCount["data"]
  count = dataCunt["media_count"]

  responseImg = HTTParty.get(urlImg)
  dataImg = responseImg["data"]
  dataImg.each do |item|
  end

  texto = "Posts con tag '" << tag.to_s << "': " << count.to_s

  render json: texto
end

end
