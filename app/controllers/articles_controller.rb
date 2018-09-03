class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @articles = Article.paginate(page: params[:page], per_page: 3)
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    
    
    if @article.save
      redirect_to article_path(@article)
      flash[:success] = 'Article was created'
    else
      render 'new'
    end
    
  end
  
  def edit

  end
  
  def update

    
    if @article.update(article_params)
      redirect_to article_path(@article)
      flash[:success] = 'Article was updated'
    else
      render 'edit'
    end
  end
  
  def show 

  end
  
  def destroy
    
    if @article.destroy
      redirect_to articles_path
      flash[:danger] = 'Article was deleted'
    else
      
    end
  end
  
  private
  
  def article_params
    params.require(:article).permit(:title, :description)
  end
  
  def set_article
    @article = Article.find(params[:id])
  end
  
end