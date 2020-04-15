class TasksController < ApplicationController
  # GET '/articles'
  def index
    @tasks = Task.all
  end

  # GET '/artciles/:id'
  def show
    @task = Task.find(params[:id])
  end

  # POST '/articles/new'
  def new
    @task = Task.new
  end

  # POST '/tasks/'
  def create
    @task = Task.new(article_params)
    @task.save
    redirect_to @task
  end

  # GET '/tasks/:id/edit'
  def edit
    @task = Task.find(params[:id])
  end

  # PATCH '/tasks/:id'
  def update
    @task = Task.find(params[:id])
    @task.update(article_params)
    redirect_to @task
  end

  # PATCH '/tasks/:id'

  def completed_status
    @task = Task.find(params[:completed])
  end

  def mark_as_done
    @task = Task.find(params[:id])
    @task.update_attribute(:completed, true)
    redirect_to @task, notice: 'Completed task'
  end

  # DELETE '/tasks/:id'
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def article_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
