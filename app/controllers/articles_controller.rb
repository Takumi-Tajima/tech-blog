class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @article.destroy!
    redirect_to articles_path, notice: 'Article was successfully destroyed.', status: :see_other
  end

  private

  def set_article
    @article = Article.find(params.expect(:id))
  end

  def article_params
    params.expect(article: %i[title body published_at])
  end
end
