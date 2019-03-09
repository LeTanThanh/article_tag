class TagsController < ApplicationController
  before_action :load_tag, only: %i|show|

  def show
    @articles = @tag.articles
  end

  private

  def load_tag
    @tag = Tag.find_by id: params[:id]
    return if @tag

    flash[:warning] = "Tag not found"
    redirect_to root_url
  end
end
