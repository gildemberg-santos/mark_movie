class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :fullname
      t.datetime :birthdate
      t.string :email
      t.string :username, index: { unique: true, name: 'unique_usernames' }
      t.string :password_digest

      t.timestamps
    end

  end
end
