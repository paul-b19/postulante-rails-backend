class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :title
      t.string :method
      t.string :url
      t.integer :collection_id

      t.timestamps
    end
  end
end
