class ChangeIssueDateNullOnBooks < ActiveRecord::Migration[6.0]
  def change
    change_column_null :books, :issue_date, false
  end
end
