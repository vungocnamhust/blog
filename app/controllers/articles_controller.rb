class ArticlesController < ApplicationController 

    def index 
        @article = Article.all
    end

    def show
        p "____show action ____________"
        p "____show action ____________"
        p "____show action ____________"
        p "____show action ____________"
        @article = Article.find(params[:id])
      end
    def new

        @email = "vungocnam0409@gmail.com"
    end

    def create
        article = Article.new(article_params)
       
        article.save
        redirect_to articlesShow_url(id: article.id)
      end
       
      private
        def article_params
          params.require(:article).permit(:title, :text)
        end

end
