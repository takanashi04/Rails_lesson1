class AddDetailMemoToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :detail_memo, :string
  end
end
