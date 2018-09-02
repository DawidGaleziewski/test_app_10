class ArticlesController < ApplicationController
  
  def index
    @articles = Article.paginate(page: params[:page], per_page: 3)
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    @article.user = User.first
    
    if @article.save
      redirect_to article_path(@article)
      flash[:success] = 'Article was created'
    else
      render 'new'
    end
    
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    
    if @article.update(article_params)
      redirect_to article_path(@article)
      flash[:success] = 'Article was updated'
    else
      render 'edit'
    end
  end
  
  def show 
    @article = Article.find(params[:id]) #finish show!
  end
  
  def destroy
    @article = Article.find(params[:id])
    
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
  
end