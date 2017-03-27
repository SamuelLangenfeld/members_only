class PostsController < ApplicationController
  before_action :user_logged_in, only: [:new, :create]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    author_id= current_user.id
    @post.user_id = author_id

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end

    def user_logged_in
      unless logged_in?
        flash[:danger] = "Sign in first"
        redirect_to signin_url
      end
    end
end
