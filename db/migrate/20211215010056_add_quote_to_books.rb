class AddQuoteToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :quote, :text
  end
end
