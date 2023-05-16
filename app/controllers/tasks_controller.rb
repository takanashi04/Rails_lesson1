class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @tasks = Task.new
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
