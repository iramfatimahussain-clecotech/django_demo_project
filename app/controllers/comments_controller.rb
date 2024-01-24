class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[create]

  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @post = Post.find(params[:Post_id])
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  # for seprate comment
  # def create
  #   @comment = Comment.new(comment_params)
  #   respond_to do |format|
  #     if @comment.save
  #       #format.html { redirect_to comment_url(@comment), notice: "Comment was successfully created." }
  #       format.json { render :show, status: :created, location: @comment }
  #         format.turbo_stream do
  #         # when use simple render by turostream
  #       #   render turbo_stream: turbo_stream.prepend(
  #       #     'comments',
  #       #     partial: "comments/comment",
  #       #     locals: { comment: @comment }
  #       #   )
  #         #render turbo_stream: helpers.autoredirect(comments_path)
  #         # when using Helper method 
  #         render turbo_stream: turbo_stream.advanced_redirect(comments_path)
  #       end
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @comment.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.turbo_stream do
          render turbo_stream: turbo_stream.remove(
            @comment
          )
        end
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def create
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to post_path(@post)
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body,:post_id,:user_id)
    end
end
