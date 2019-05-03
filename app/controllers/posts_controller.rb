class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @q = Post.all.order(created_at: :desc).ransack(params[:q]) #created_at: :desc 更新日を降順にする
    @posts = @q.result.page(params[:page]).per(2)
    # (distinct: true) distinct:かぶっている処理をまとめる #.ransack=>検索機能
    @new_post = Post.find_newest_article             
    @author = Author.first
  end

  def show
    # set_post =>before_actionで実行されてすでに読んでいるから
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
    # set_post =>before_actionで実行されてすでに読んでいるから
    puts "--------------------------------------------"
    p @post #確認したいときようp
  end

  def update
    # set_post =>before_actionで実行されてすでに読んでいるから
    @post.update(post_params)
    redirect_to @post
    # 1件データを取得([:id])を使用して
    # updateメソッドを使って更新
    # 詳細画面にリダイレクト
  end

  def destroy
    # set_post =>before_actionで実行されてすでに読んでいるから
    @post.destroy
    redirect_to posts_path
  end
  def post_params
    params.require(:post).permit(:title,:body,:category)
  end
  def set_post
    @post =Post.find(params[:id])
  end
end
