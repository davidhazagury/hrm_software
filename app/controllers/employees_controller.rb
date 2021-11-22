class EmployeesController < ApplicationController
  def index
    @employees = Employee.where(company_id: current_user.company_id)
    authorize @employees
  end
end
