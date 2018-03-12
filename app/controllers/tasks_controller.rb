class TasksController < ApplicationController
  def index
    @pending_tasks = Task.where(status: "pending")
    @completed_tasks = Task.where(status: "completed")
  end
  
  def create
    attributes = task_params
    attributes[:status] = "pending"
    Task.create attributes
    redirect_to :back, :notice => 'task added'
  end
  
  def destroy
    task = Task.find(params[:id])
    task.status = "completed"
    task.save
    redirect_to tasks_path
  end
  
  private
  
  def task_params
    params.require(:task).permit(:task)
  end
end
