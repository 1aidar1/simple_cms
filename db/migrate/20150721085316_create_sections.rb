class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.text :content
      t.boolean :visible
      t.integer :position
      t.integer :page_id

      t.timestamps null: false
    end
  end
end
