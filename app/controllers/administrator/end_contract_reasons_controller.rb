class Administrator::EndContractReasonsController < ApplicationController

  def index
  @reasons = policy_scope([:administrator,EndContractReason.order(:name_of_end_reason)])
  end

  def new
    @reason = EndContractReason.new
    authorize [:administrator, @reason]
  end

  def create
    @reason = EndContractReason.new(reason_params)
    authorize [:administrator, @reason]
    if @reason.save
      redirect_to administrator_end_contract_reasons_path, notice: t('admin.end_contract_reason.create.notice')
    else
      render :new, alert: t('admin.end_contract_reason.create.alert')
    end
  end

  def edit
    @reason = EndContractReason.find(params[:id])
    authorize [:administrator, @reason]
  end

  def update
    @reason = EndContractReason.find(params[:id])
    authorize [:administrator, @reason]
    if @reason.update(reason_params)
      redirect_to administrator_end_contract_reasons_path, notice: t('admin.end_contract_reason.update.notice')
    else
      render :edit, t('admin.end_contract_reason.update.alert')
    end
  end

  def destroy
    @reason = EndContractReason.find(params[:id])
    authorize [:administrator, @area]
    if @reason.destroy
      redirect_to administrator_areas_path, notice: t('admin.end_contract_reason.destroy.notice')
    else
      redirect_to administrator_end_contract_reasons_path, alert: t('admin.end_contract_reason.destroy.alert')
    end
  end

  private

  def reason_params
    params.require(:end_contract_reason).permit(:name_of_end_reason)
  end
end
