class ArticlesController < ApplicationController 
    http_basic_authenticate_with name: "namvu", password: "secret", except: [:index, :show]


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
        p "Index ++++++++++++++++\n"
        p "Index ++++++++++++++++\n"
        p "Index ++++++++++++++++\n"
        p "Index ++++++++++++++++\n"
        searchValue = params[:search]
        if (searchValue.blank?) 
            @articles = Article.all
        else 
            @articles = Article.where("title LIKE ?", "%" + searchValue +"%")
        end
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new         
    end

    def edit 
        @article = Article.find(params[:id])
    end

    def create
        p "Create ++++++++++++++++\n"
        p "Create ++++++++++++++++\n"
        p "Create ++++++++++++++++\n"
        p "Create ++++++++++++++++\n"

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
