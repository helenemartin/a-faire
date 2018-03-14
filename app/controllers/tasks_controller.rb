class TasksController < ApplicationController
  def index
    @pending_tasks = Task.where(status: "pending")
    @completed_tasks = Task.where(status: "completed").order("created_at DESC")
  end
  
  
  def create
    attributes = task_params
    attributes[:status] = "pending"
    task = Task.create attributes
    if task.persisted?
      flash[:notice] = "Task created"
    else
      flash[:alert] = task.errors.full_messages
    end
    redirect_to :back
  end
  
  def destroy
    task = Task.find(params[:id])
    task.status = "completed"
    task.save
    flash[:notice] = "Task completed"
    redirect_to tasks_path
  end
  
  private
  
  def task_params
    params.require(:task).permit(:task)
  end
end
