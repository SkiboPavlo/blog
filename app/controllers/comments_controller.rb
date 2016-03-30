class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @blog = Blog.find params[:blog_id]
  end

  def edit
    @blog = Blog.find params[:blog_id]
    @comment = Comment.find params[:id]
  end

  def like
    @comment = Comment.find params[:id]
    @comment.like!
    redirect_to :back
  end

  def create
    @comment = Comment.new(comment_params.merge(blog_id: params[:blog_id]))

    if @comment.save
      redirect_to :back
    else
      flash[:errors] = @comment.errors.messages
      redirect_to :back
    end
  end

  def update
    @comment = Comment.find params[:id]

    if @comment.update_attributes(comment_params)
      redirect_to new_blog_comment_path
    else
      flash[:errors] = @comment.errors.messages
      redirect_to :back
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
