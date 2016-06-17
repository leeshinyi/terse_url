class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :address
      t.string :slug

      t.timestamps null: false
    end
  end
end
