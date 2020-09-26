class ArticlesController < ApplicationController 

    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path
    end

    def update 
        @article = Article.find(params[:id])
        if (@article.update(article_params)) 
            redirect_to @article
        else 
            render 'edit'
        end
    end

    def index 
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        @email = "vungocnam0409@gmail.com"
    end

    def edit 
        @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            redirect_to articlesShow_url(id: @article.id)
        else 
            render 'new'
        end
    end
       
      private
        def article_params
          params.require(:article).permit(:title, :text)
        end

end
