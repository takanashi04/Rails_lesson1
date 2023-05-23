class TasksController < ApplicationController
  def index
    @task= Task.all
  end

  def create
    @task = Task.new(params.require(:task).permit(:title, :start_date, :end_date, :all_day, :update_time, :created_at, :updated_at, :detail_memo))
    if @task.save
      flash[:notice] = "新しい予定を登録しました"
      redirect_to :tasks # 別のURLで再アクセスさせる
    else
      render "new"
    end
  end

  def new
    @task= Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def task_params
    params.require(:task).permit(
      :title,
      :start_date,
      :end_date,
      :all_day,
    )
  end

end
