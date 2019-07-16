class CreateAddUserArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :username, :string

    add_index :articles, :username, unique: true
  end
end
