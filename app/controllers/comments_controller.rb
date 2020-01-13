class CommentsController < ApplicationController
  before_action :find_comemnt, only: [ :destroy , :edit]
  before_action :find_post, only: [ :create, :destroy]

  def create
    @comment = @post.comments.create(comment_params)
    if @comment.save
      redirect_to @post
    end
  end

  def error
  end

  def edit
    post=Post.find(params[:post_id])
  end

  def destroy
    @comment.destroy
    redirect_to @post
  end

  def new
  end

  def update
    #1st you have to find the specific post
    post = Post.find(params[:post_id])
    #2nd you retrieve the comment thanks to params[:id]
    @comment = post.comments.find(params[:id])
    respond_to do |format|
      if @comment.update_attributes(comment_params)
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
        format.html { redirect_to post }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  private
    def find_post
      @post = Post.find(params[:post_id])
    end

    def find_comemnt
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:commenter,:body)
    end

end
