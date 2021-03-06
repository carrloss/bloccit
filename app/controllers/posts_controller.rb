class PostsController < ApplicationController

before_action :require_sign_in, except: :show


  def show
    @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end


  def create

    @topic = Topic.find(params[:topic_id])
    #mass assignment
    @post = @topic.posts.build(post_params) #defined in 'private'
    @post.user = current_user

    if @post.save
      flash[:notice] = "Post was saved succesfully."
      redirect_to [@topic, @post]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end



  def edit
    @post = Post.find(params[:id])
  end



  def update
    @post = Post.find(params[:id])
    #mass assignment
    @post.assign_attributes(post_params)

    if @post.save
      flash[:notice] = "Post was updated succesfully."
      redirect_to [@post.topic, @post]
    else
      flash.now[:alert] = "There was an error saving the post.Please try again."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deletedsuccesfully."
      redirect_to @post.topic
    else
      flsh.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end


  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
