class MoviesController < ApplicationController
  def index
    if params[:query].present? #if you insert anything in search bar
      #sql_query = "title ILIKE :query OR syllabus ILIKE :query"
      # sql_query = " \
      # movies.title ILIKE :query \
      # OR movies.syllabus ILIKE :query \
      # OR directors.first_name ILIKE :query \
      # OR directors.last_name ILIKE :query \
      # "
      # sql_query = " \
      # movies.title @@ :query \
      # OR movies.syllabus @@ :query \
      # OR directors.first_name @@ :query \
      # OR directors.last_name @@ :query \
      # "

      #@movies = Movie.where(title: params[:query])
      #@movies = Movie.where("title ILIKE ?", "%#{params[:query]}%")
      #@movies = Movie.where(sql_query, query: "%#{params[:query]}%")
      #@movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")
      #@movies = Movie.global_search(params[:query])
      @movies = PgSearch.multisearch(params[:query])
      #SQL
    else
      @movies = Movie.all
    end
  end
end
