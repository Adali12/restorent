class CommentsController < ApplicationController
  def index
    @resto = Resto.find(params[:resto_id])
  end
  def create
    @resto = Resto.find(params[:resto_id])
    @comment = @resto.comments.build(comment_params)
    # Change format according to client request
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to resto_path(@resto), notice: 'Post failed...' }
      end
    end
  end
  private
 # Strong Parameter
 def comment_params
   params.require(:comment).permit(:resto_id,:content)
 end
end
