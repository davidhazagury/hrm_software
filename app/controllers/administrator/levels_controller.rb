class Administrator::LevelsController < ApplicationController

  def index
    @levels = policy_scope([:administrator, Level.order(:type_of_level)])
  end

  def new
    @level = Level.new
    authorize [:administrator, @level]
  end

  def create
    @level = Level.new(level_params)
    authorize [:administrator, @level]
    if @level.save
      redirect_to administrator_levels_path, notice: t('admin.level.create.notice')
    else
      render :new, t('admin.level.create.alert')
    end
  end

  def edit
    @level = Level.find(params[:id])
    authorize [:administrator, @level]
  end

  def update
    @level = Level.find(params[:id])
    authorize [:administrator, @level]
    if @level.update(level_params)
      redirect_to administrator_levels_path, notice: t('admin.level.update.notice')
    else
      render :edit, t('admin.level.update.alert')
    end
  end

  def destroy
    @level = Level.find(params[:id])
    authorize [:administrator, @level]
    if @level.destroy
      redirect_to administrator_levels_path, notice: t('admin.level.destroy.notice')
    else
      redirect_to administrator_levels_path, alert: t('admin.level.destroy.alert')
    end
  end

  private

  def level_params
    params.require(:level).permit(:type_of_level)
  end
end
