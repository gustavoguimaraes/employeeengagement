class PostsController < ApplicationController
 before_filter :authenticate_user!
  def new
    @post = Post.new

    respond_to do |format|
      format.html
      format.json {render json: @post}
    end
  end

  def approved
    post = Post.find(params[:id])
    post.approved!

    redirect_to dashboard_path
  end

  def rejected
    post = Post.find(params[:id])
    post.rejected!

    redirect_to dashboard_path
  end



  def create
    url = params[:post][:url]
    return redirect_to "/posts/new", notice: "Invalid format" if url.blank? || meta_inspector(url).title.empty?
      @post = Post.new(url: url ,
                      title: meta_inspector(url).title,
                      content: meta_inspector(url).description,
                      image: meta_inspector(url).images.best,
                      state: :pending)
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
    params.require(:post).permit(:url)
  end

  def meta_inspector(valid_url)
    @meta_inspector ||= MetaInspector.new(valid_url, warn_level: :store, :connection_timeout => 5, :read_timeout => 5)
  end

end