class NewsPostsController < ApplicationController
  def new
    @news_posts = NewsPost.new
  end

  def getAll

  end

  def index
    @allNews = NewsPost.all
  end

  def create
    if(params[:title].blank? || params[:body].blank? )
      @error = 'form error'
      redirect_to '/news/new'
    else
      @newPost = NewsPost.create(title:params[:title], body:params[:body])
      if @newPost.save
        redirect_to "/news/#{@newPost.id}"
      else
        redirect_to '/news/new'

      end
    end
  end

  def show
    @id = params[:id]
    @id = @id.to_i
    if(!@id.blank?)
      @article = NewsPost.find(@id)
    end
  end

  def edit
    @hello = ""
  end

end
