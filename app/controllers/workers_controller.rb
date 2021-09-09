class WorkersController < ApplicationController
  def index
    @workers = policy_scope(Worker.all)
  end

  def new
    @worker = Worker.new()
    authorize @worker
  end

  def create
    @worker = Worker.new()
    authorize @worker
    if @worker.save(worker_params)
    else
      render :new
    end
  end

  private

end
