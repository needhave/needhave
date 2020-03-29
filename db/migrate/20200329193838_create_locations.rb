class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :display_name
      t.st_point :lonlat, geographic: true
      t.jsonb 'address'

      t.timestamps
    end
    add_index :locations, :address, using: 'gin'

    change_table(:needs) do |t|
      t.bigint :location_id
    end
    change_table(:haves) do |t|
      t.bigint :location_id
    end
    
    add_foreign_key :haves, :locations
    add_foreign_key :needs, :locations
  end
end
