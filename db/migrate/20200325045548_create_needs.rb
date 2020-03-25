class CreateNeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :needs do |t|
      t.text :description
      t.text :instructions
      t.bigint :entity_id

      t.timestamps
    end
  end
end
