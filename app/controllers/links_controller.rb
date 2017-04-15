class LinksController < ApplicationController
  def new
  end

  def create
    @user = current_user
    @link = @user.links.new(link_params)
    if @link.save
     redirect_to root_path
    else
     render 'new'
    end
  end

  def index
  @links = Link.all
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
     redirect_to root_path
    else
     render 'edit'
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def upvote
   @link = Link.find(params[:id])
   @link.upvote_by current_user
   redirect_to:back
  end

  def downvote
  @link = Link.find(params[:id])
  @link.downvote_by current_user
  redirect_to:back
  end

  def url_with_protocol(abc)
      /^http/i.match(abc) ? url : "http://#{abc}"
  end


  def destroy
    @link = Link.find(params[:id])
    if @link.user == current_user
    @link.destroy
    redirect_to root_path
    end
  end
  private
    def link_params
      params.require(:link).permit(:title, :url)
    end
end
