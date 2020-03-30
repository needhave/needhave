class CreateNeedCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :need_categories do |t|
      t.text :name
      t.text :slug, unique: true
      t.text :description, null: true
      t.bigint :parent_id, null: true

      t.timestamps
    end
    add_foreign_key :need_categories, :need_categories, column: :parent_id

    change_table(:need_posts) do |t|
      t.bigint :category_id, null: false
    end
    change_table(:have_posts) do |t|
      t.bigint :category_id, null: false
    end

    add_foreign_key :have_posts, :need_categories, column: :category_id
    add_foreign_key :need_posts, :need_categories, column: :category_id
  end
end
