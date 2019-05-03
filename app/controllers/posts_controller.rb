      class PostsController < ApplicationController
  def index
    @posts = Post.all
    @new_post = Post.all
    @author = Author.first
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
  end

  def edit
    @post = Post.find(params[:id])
    puts "--------------------------------------------"
    p @post #確認したいときようp
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to @post
    # 1件データを取得([:id])を使用して
    # updateメソッドを使って更新
    # 詳細画面にリダイレクト
  end

  def destroy
    @post =Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  def post_params
    params.require(:post).permit(:title,:body,:category)
  end
end
