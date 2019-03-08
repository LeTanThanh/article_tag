class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find_by id: params[:id]
    @tags = @article.tags
  end

  def edit
    @article = Article.find_by id: params[:id]
  end

  def update
    @article = Article.find_by id: params[:id]

    if @article.update_attributes article_params
      redirect_to root_url
    else
      redirect_to edit_article_path(@article)
    end
  end

  private

  def article_params
    params.require(:article).permit :title, :tags_name, :content
  end
end
