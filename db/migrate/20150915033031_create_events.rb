class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.text :keywords
      t.datetime :start_time
      t.string :facebook_event_link
      t.string :main_image
      t.string :slug
      t.boolean :published
      t.boolean :archived

      t.timestamps null: false
    end
  end
end
