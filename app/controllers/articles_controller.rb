class ArticlesController < ApplicationController
  before_action :load_article, only: %i|show edit update|

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new article_params

    if @article.save
      flash[:success] = "Article is updated"
      redirect_to @article
    else
      @tags_name = article_params[:tags_name]

      flash[:danger] = "Article isn't created"
      render :new
    end
  end

  def show
    @tags = @article.tags
  end

  def edit; end

  def update
    if @article.update_attributes article_params
      flash[:success] = "Article is updated"
      redirect_to @article
    else
      @tags_name = article_params[:tags_name]

      flash[:danger] = "Article isn't updated"
      render :edit
    end
  end

  private

  def article_params
    params.require(:article).permit :title, :tags_name, :content
  end

  def load_article
    @article = Article.find_by id: params[:id]
    return if @article

    flash[:warning] = "Article not found"
    redirect_to root_url
  end
end
