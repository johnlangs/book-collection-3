class AddPublishedDateToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :published_date, :date
  end
end
