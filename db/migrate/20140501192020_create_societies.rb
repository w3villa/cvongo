class CreateSocieties < ActiveRecord::Migration
  def change
    create_table :societies do |t|
      t.string :name
      t.integer :locality_id

      t.timestamps
    end
  end
end
