class ArticlesController < ApplicationController
  before_action :load_article, only: %i|show edit update|

  def index
    @articles = Article.all
  end

  def show
    @tags = @article.tags
  end

  def edit; end

  def update
    if @article.update_attributes article_params
      flash[:success] = "Article is updated"
      redirect_to root_url
    else
      flash[:warning] = "Article isn't updated"
      redirect_to edit_article_path(@article)
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
