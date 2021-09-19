class Administrator::TypeOfContractsController < ApplicationController
  def index
    @type_of_contracts = policy_scope([:administrator, TypeOfContract.order(:name_type_of_contract)])
  end

  def new
    @type_of_contract = TypeOfContract.new
    authorize [:administrator, @type_of_contract]
  end

  def create
    @type_of_contract = TypeOfContract.new(contract_params)
    authorize [:administrator, @type_of_contract]
    if @type_of_contract.save
      redirect_to administrator_type_of_contracts_path, notice: t('admin.type_of_contract.create.notice')
    else
      render :new, t('admin.type_of_contract.create.alert')
    end
  end

  def edit
    @type_of_contract = TypeOfContract.find(params[:id])
    authorize [:administrator, @type_of_contract]
  end

  def update
    @type_of_contract = TypeOfContract.find(params[:id])
    authorize [:administrator, @type_of_contract]
    if @type_of_contract.update(contract_params)
      redirect_to administrator_type_of_contracts_path, notice: t('admin.type_of_contract.update.notice')
    else
      render :edit, t('admin.type_of_contract.update.alert')
    end
  end

  def destroy
    @type_of_contract = TypeOfContract.find(params[:id])
    authorize [:administrator, @type_of_contract]
    if @level.destroy
      redirect_to administrator_type_of_contracts_path, notice: t('admin.type_of_contract.destroy.notice')
    else
      redirect_to administrator_type_of_contracts_path, alert: t('admin.type_of_contract.destroy.alert')
    end
  end

  private

  def contract_params
    params.require(:type_of_contract).permit(:name_type_of_contract)
  end
end
