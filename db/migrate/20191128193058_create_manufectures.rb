class CreateManufectures < ActiveRecord::Migration[5.2]
  def change
    create_table :manufectures do |t|
      t.string :name

      t.timestamps
    end
  end
end
