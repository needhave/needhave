class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.text :name
      t.text :slug, unique: true
      t.text :description, null: true
      t.bigint :parent_id, null: true

      t.timestamps
    end
    add_foreign_key :categories, :categories, column: :parent_id

    change_table(:need_posts) do |t|
      t.bigint :category_id, null: false
    end
    change_table(:have_posts) do |t|
      t.bigint :category_id, null: false
    end

    add_foreign_key :have_posts, :categories, column: :category_id
    add_foreign_key :need_posts, :categories, column: :category_id
  end
end
