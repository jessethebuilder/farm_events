class CreateAddress < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :label
      t.string :street
      t.string :street2
      t.string :street3
      t.string :number
      t.string :care_of
      t.string :city
      t.string :state
      t.string :zip
      t.float :lat
      t.float :lon
      t.string :has_address_type
      t.integer :has_address_id

      t.timestamps null: false
    end
  end

end
