class PostsController < ApplicationController

  def new
    @post = Post.new

    respond_to do |format|
      format.html
      format.json {render json: @post}
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to dashboard_path, :notice => "Post was sucessfully created" }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { action "new" }
        format.json { render json: @post.errors}
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :title)
  end

end