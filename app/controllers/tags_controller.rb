class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    @tag = Tag.find(params[:id]).destroy

    flash.notice = "Tag #{@tag.name} Destroyed"

    redirect_to articles_path
  end
end
