class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  
  def create
    Task.create task_params 
    redirect_to :back
  end
  
  private
  
  def task_params
    params.require(:task).permit(:task)
  end
end
