class UpdateUserFieldInPiscine < ActiveRecord::Migration[7.0]
    def change
      remove_column :piscines, :user, :string
      add_reference :piscines, :user, foreign_key: true
    end
  end
  
