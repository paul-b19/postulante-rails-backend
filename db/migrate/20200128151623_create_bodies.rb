class CreateBodies < ActiveRecord::Migration[6.0]
  def change
    create_table :bodies do |t|
      t.string :body_type
      t.string :key
      t.string :value
      t.string :description
      t.text :raw_body
      t.integer :request_id

      t.timestamps
    end
  end
end
