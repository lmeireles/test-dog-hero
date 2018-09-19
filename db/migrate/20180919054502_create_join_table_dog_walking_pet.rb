class CreateJoinTableDogWalkingPet < ActiveRecord::Migration[5.2]
  def change
    create_join_table :dog_walkings, :pets do |t|
      t.index [:dog_walking_id, :pet_id]
    end
  end
end
