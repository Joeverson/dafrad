class ArticlesController < ApplicationController
  before_action :set_articles, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, except: [:index, :show]

  #GET /feed
  def feed
    @articles = Article.all
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  # GET /articles
  def index
    @articles = Article.last_published.paginate(:page => params[:page]).all
  end

  # GET /articles/:id
  def show
    # respond_to do |format|
    #   format.html { render :show }
    #   format.json { render json: @article, status: :created }
    #   # format.xml { render xml: @article, status: :created }
    # end
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/:id/edit
  def edit
  end

  # POST /articles
  def create
    @article = Article.new(set_params)
    respond_to do |format|
      if @article.save
        format.html {
          # flash[:success] = 'Article was successfully created.'
          # redirect_to article_path(@article), flash: { :success => 'Article was successfully created.' }
          # flash: notice, error, alert
          redirect_to article_path(@article), notice: 'Article was successfully created.'
        }
        format.json { render @article, status: :created }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/:id
  def update
    if @article.update(set_params)
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  # DELETE /artiles/:id
  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

    def set_articles
      @article = Article.find(params[:id])
    end

    def set_params
      params.require(:article).permit(:title,:text)
    end
end
