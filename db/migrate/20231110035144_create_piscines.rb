class CreatePiscines < ActiveRecord::Migration[7.0]
  def change
    create_table :piscines do |t|
      t.string :name
      t.string :adress
      t.string :cp
      t.string :ville
      t.string :pays
      t.string :mail
      t.string :tel
      t.string :user
      t.time :mondaystart
      t.time :mondayend
      t.time :tuesdaystart
      t.time :tuesdayend
      t.time :wednesdaystart
      t.time :wednesdayend
      t.time :thursdaystart
      t.time :thursdayend
      t.time :fridaystart
      t.time :fridayend
      t.time :saturdaystart
      t.time :saturdayend
      t.time :sundaystart
      t.time :sundayend

      t.timestamps
    end
    add_index :piscines, :user
  end
end
