class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    #was @article = Article.new(params[:article]) bad idea? explain?
    @article = Article.new(article_params) #from our helper
    @article.save

    redirect_to article_path(@article)
  end
end
