class MoviesController < ApplicationController

  def all
    @movies = Movie.all
    render json: @movies
  end

  def search
    if params[:t]
      @movie = Movie.where(:title => params[:t])
    elsif params[:y]
      @movie = Movie.where(:year => params[:y])
    elsif params[:t] && params[:y]
      @movie = Movie.where(:year => params[:y], :title => params[:t])
    end
    render json: @movie
  end

  # def search
  #   @movies = Movie.all
  #   if params[:t]
  #     movie_title = params[:t].capitalize
  #     @movie = Movie.where("title LIKE ?", "%#{movie_title}%")
  #     render json: @movie
  #   elsif params[:y]
  #     @movie = Movie.where(:year => params[:y])
  #     render json: @movie
  #   elsif params[:t] && params[:y]
  #     @movie = Movie.where(:year => params[:y]) && Movie.where(:title => params[:t])
  #     render json: @movie
  #   end
  # end

end







# respond_to do |format|
#   format.json {render json: @movies}
#   format.html {render 'all'}
# end
