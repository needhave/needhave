class CreateEntities < ActiveRecord::Migration[6.0]
  def change
    create_table :entities do |t|
      t.text :description
      t.boolean :verified
      t.boolean :is_corporate
      t.text :contact_phone
      t.text :contact_email

      t.timestamps
    end

    change_table(:needs) do |t|
      t.bigint :entity_id
    end
    change_table(:haves) do |t|
      t.bigint :entity_id
    end
    add_foreign_key :haves, :entities
    add_foreign_key :needs, :entities
  end
end
