class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    render("movies/index.html.erb")
  end

  def new_form
    render("movies/new_form.html.erb")
  end

  def create_row
    @movie = Movie.new
    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]

    @movie.save

    render("show")
  end

  def edit_form
    @movie = Movie.find(params[:id])
    render("movies/edit_form.html.erb")
  end

  def update_row
    @movie = Movie.find(params[:id])
    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]
    @movie.save
    redirect_to("/movies/#{@movie.id}")
  end

  def destroy_row
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to("/movies")

  end

  def show
    @movie = Movie.find(params[:id])
    render("movies/show.html.erb")
  end

end
