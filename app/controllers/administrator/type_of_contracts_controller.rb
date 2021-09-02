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
      redirect_to administrator_type_of_contracts_path, notice: "Contrato creado correctamente."
    else
      render :new
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
      redirect_to administrator_type_of_contracts_path, notice: "Contrato actualizado correctamente."
    else
      render :edit
    end
  end

  def destroy
    @type_of_contract = TypeOfContract.find(params[:id])
    authorize [:administrator, @type_of_contract]
    if @level.destroy
      redirect_to administrator_type_of_contracts_path, notice: "Contrato elimanado correctamente."
    else
      redirect_to administrator_type_of_contracts_path, alert: "No se ha podido eliminar el contrato"
    end
  end

  private

  def contract_params
    params.require(:type_of_contract).permit(:name_type_of_contract)
  end
end
