class CreateAttribs < ActiveRecord::Migration[6.0]
  def change
    create_table :attribs do |t|
      t.string :attr_type
      t.string :key
      t.string :value
      t.string :description
      t.integer :request_id

      t.timestamps
    end
  end
end
