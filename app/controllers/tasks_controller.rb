class TasksController < ApplicationController
  def index
    @task= Task.all
  end

  def create
    @task = Task.new(params.require(:tasks).permit(:title, :start_date, :end_date, :all_day, :detail_memo))
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
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
