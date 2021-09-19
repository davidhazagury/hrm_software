class Administrator::GenresController < ApplicationController
  def index
    @genres = policy_scope([:administrator, Genre.order(:type_of_genre)])
  end

  def new
    @genre = Genre.new
    authorize [:administrator, @genre]
  end

  def create
    @genre = Genre.new(genre_params)
    authorize [:administrator, @genre]
    if @genre.save
      redirect_to administrator_genres_path, notice: t('admin.genre.create.notice')
    else
      render :new, alert: t('admin.genre.create.alert')
    end
  end

  def edit
    @genre = Genre.find(params[:id])
    authorize [:administrator, @genre]
  end

  def update
    @genre = Genre.find(params[:id])
    authorize [:administrator, @genre]
    if @genre.update(genre_params)
      redirect_to administrator_genres_path, notice: t('admin.genre.update.notice')
    else
      render :edit, alert: t('admin.genre.update.alert')
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    authorize [:administrator, @genre]
    if @genre.destroy
      redirect_to administrator_genres_path, notice: t('admin.genre.destroy.notice')
    else
      redirect_to administrator_genres_path, alert: t('admin.genre.destroy.alert')
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:type_of_genre)
  end
end
