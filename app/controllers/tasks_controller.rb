class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def edit
  end
end
