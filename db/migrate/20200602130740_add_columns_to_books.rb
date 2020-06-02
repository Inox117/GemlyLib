class AddColumnsToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :isbn10, :string
    add_column :books, :isbn13, :string
    add_column :books, :author, :string
    add_column :books, :illustrator, :string
    add_column :books, :publication_date, :string
    add_column :books, :publisher, :string
    rename_column :books, :text, :summary
    add_column :books, :number_of_page, :integer
  end
end
