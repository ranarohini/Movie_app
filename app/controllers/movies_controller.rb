# Movie controller

class MoviesController < ApplicationController
  # GET /movies
  def index
    @movies = Movie.search(params[:search]).paginate(page: params[:page])
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # POST /movies
  def create
    @movie = Movie.new(white_listed_parameters)
    if @movie.save
      flash[:notice] = 'Saved!'
      redirect_to movies_path
    else
      render :new
    end
  end

  # GET /movies/:id/edit
  def edit
    find_movie
  end

  # PUT /movies
  def update
    find_movie
    if @movie.update_attributes(white_listed_parameters)
      flash[:notice] = 'Saved!'
      redirect_to movies_path
    else
      render :edit
    end
  end

  private

  # White lists the movies parameters
  def white_listed_parameters
    params
      .require(:movie)
      .permit(:title, :description, :year_released)
  end

  # Finds the movie in the database, and redirects if unable to find one
  def find_movie
    begin
      @movie = Movie.find(params[:id])
    rescue
      redirect_to movies_path
    end
  end
end
