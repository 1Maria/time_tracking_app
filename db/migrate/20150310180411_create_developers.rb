class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
      t.string :developer_name
      t.string :email_address
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
