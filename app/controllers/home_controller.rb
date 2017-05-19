class HomeController < ApplicationController
  def index
    @everyPost = Post.all.reverse
  end
  
  def upload
    
    newPost = Post.new
    newPost.title = params[:inputTitle]
    newPost.content = params[:inputContent]
    
    u = PizzaUploader.new
    u.store!(params[:inputImage])
    newPost.image_url = u
     
    newPost.save
    
    flash[:notice] = "작성되었습니다."
    
    redirect_to :back
  end
end
