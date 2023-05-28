class TasksController < ApplicationController
  def index
    @task= Task.all
  end

  def create
    @task = Task.new(params.require(:task).permit(:title, :start_date, :end_date, :all_day, :update_time, :created_at, :updated_at, :detail_memo))
    if @task.save
      flash[:notice] = "新しい予定を登録しました"
      redirect_to :tasks # 別のURLで再アクセスさせる
      # DBから編集前のデータを取得している（そのため入力した値がなくなる）
    else
      render "new" # ビューファイルを指定する
      # 直接ファイルを参照する
    end
  end

  def new
    @task= Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(params.require(:task).permit(:title, :start_date, :end_date, :all_day))
      flash[:notice] = "idが「#{@task.id}」の情報を更新しました"
      redirect_to :tasks
    else
      render "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "予定を削除しました"
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
