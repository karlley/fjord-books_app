class ChangeColumnNullOnReports < ActiveRecord::Migration[6.1]
  def change
    change_column_null :reports, :title, false
    change_column_null :reports, :content, false
  end
end
