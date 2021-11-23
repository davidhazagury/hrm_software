class EmployeesController < ApplicationController
  def index
    @employees = policy_scope(Employee.where(company_id: current_user.company_id))
    authorize @employees
  end

  def new
    @employee = Employee.new()
    authorize @employee
  end

  def create
    @employee = Employee.new(employee_params)
    assign_company_to_new_employe
    authorize @employee
    if @employee.save!
      if folder_created_in_Aws_for_new_employee?
        redirect_to employees_path, notice: t('general_alerts.notice')
      else
        # If the folder doesnt get created, we delete de employee we have created
        @employee.destroy
        render :new, alert: t('general_alerts.alert')
      end
    else
      render :new, alert: t('general_alerts.alert')
    end
  end

  def show
    @employee = Employee.find(params[:id])
    authorize @employee
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :birth_date, :start_date,
                               :department_id, :sin_num, :personal_email,
                               :id_num, :type_of_contract_id, :genre_id, :phone_number,
                               :bank_account, :type_of_shift_id, :position_id, :trial_period,
                               :annual_salary, :avatar, files: [])
  end

  def assign_company_to_new_employe
    if @employee
      @employee.company_id = current_user.company_id
      @employee.role_ids = [2]
      # WE NEED TO CHANGE THIS EMAIL
      @employee.email = @employee.personal_email
    end
  end

  def folder_created_in_Aws_for_new_employee?
    c = Aws::S3::Client.new(region: 'eu-west-1', access_key_id: ENV['AWS_ACCESS_KEY_ID'], secret_access_key: ENV['SECRET_ACCESS_KEY'])
    bucket_name = "#{@employee.company.name_of_company.parameterize}-#{@employee.company.id}"
    folder_name = "#{@employee.first_name.parameterize}-#{@employee.last_name.parameterize}-#{@employee.id}-#{@employee.id_num}/"
    response = c.put_object(bucket: bucket_name, key:folder_name)
    if response != nil
      return true
    else
      return false
    end
   end
end
