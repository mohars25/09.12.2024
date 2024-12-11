class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end