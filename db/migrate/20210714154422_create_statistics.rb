class CreateStatistics < ActiveRecord::Migration[5.2]
  def change
    create_table :statistics do |t|
      t.string :uf
      t.string :state
      t.integer :casess
      t.integer :deaths
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
