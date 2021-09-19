class Administrator::GroupsController < ApplicationController
  def index
    @groups = policy_scope([:administrator, Group.order(:type_of_group)])
  end

  def new
    @group = Group.new
    authorize [:administrator, @group]
  end

  def create
    @group = Group.new(group_params)
    authorize [:administrator, @group]
    if @group.save
      redirect_to administrator_groups_path, notice: t('admin.group.create.notice')
    else
      render :new, alert: t('admin.group.create.alert')
    end
  end

  def edit
    @group = Group.find(params[:id])
    authorize [:administrator, @group]
  end

  def update
    @group = Group.find(params[:id])
    authorize [:administrator, @group]
    if @group.update(group_params)
      redirect_to administrator_groups_path, notice: t('admin.group.update.notice')
    else
      render :edit, alert: t('admin.group.update.alert')
    end
  end

  def destroy
    @group = Group.find(params[:id])
    authorize [:administrator, @group]
    if @group.destroy
      redirect_to administrator_gruops_path, notice: t('admin.group.destroy.notice')
    else
      redirect_to administrator_gruops_path, alert: t('admin.group.destroy.alert')
    end
  end

  private

  def group_params
    params.require(:group).permit(:type_of_group)
  end
end
