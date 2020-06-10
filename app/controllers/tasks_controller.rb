class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = current_user.tasks.order(id: :desc)
  end 
    
  def show
  end
    
  def new
    @task = current_user.tasks.build
  end 
  
  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = 'タスクは作成されました'
      redirect_to @task
    else 
      flash.now[:danger] = 'タスクを作成できませんでした'
      render :new
    end 
  end
  
  def edit
  end
  
  def update
    if @task.update(task_params)
      flash[:success] = 'タスクは更新されました'
      redirect_to @task
    else 
      flash.now[:danger] = 'タスクを更新できせんでした'
      render :edit
    end 
  end
  
  def destroy
    @task.destroy
    
    flash[:success] = 'タスクは削除されました'
    redirect_to tasks_url
  end
  
  private
  
  def set_task
    @task = current_user.tasks.find(params[:id])
  end 
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
end
