class PagesController < ApplicationController
  def home
  end

  def search
    @tvshows = TvShow.all
    @movies = Movie.all
    if params[:query].present? #if you insert anything in search bar
      @results = PgSearch.multisearch(params[:query])
    end
  end
end
