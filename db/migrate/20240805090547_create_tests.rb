class CreateTests < ActiveRecord::Migration[7.1]
  def change
    create_table :tests, id: :uuid do |t|
      t.string :first_name, limit: 50, null: true
      t.string :last_name, limit: 30, null: true
      t.integer :age, default: 0, null: true
      t.string :contact_number, limit: 13, null: false
      t.string :email, limit: 100, null: false
      t.string :password, limit: 64, null: false

      t.timestamps
    end
    add_index :tests, :contact_number, unique: true
    add_index :tests, :email, unique: true
  end
end
