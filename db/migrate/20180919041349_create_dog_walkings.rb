class CreateDogWalkings < ActiveRecord::Migration[5.2]
  def change
    create_table :dog_walkings do |t|
      t.integer :status, default: 0
      t.integer :duration
      t.date :scheduled_to
      t.decimal :price, precision: 6, scale: 2
      t.string :lat
      t.string :lng
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end
  end
end
