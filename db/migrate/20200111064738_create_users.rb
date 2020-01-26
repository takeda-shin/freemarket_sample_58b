class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string    :nickname,          null: false
      t.string	  :family_name,       null: false
      t.string	  :family_name_kana,  null: false
      t.string	  :first_name,        null: false
      t.string	  :first_name_kana,   null: false
      t.string	  :email,             null: false
      t.string	  :password,          null: false
      t.integer   :birthday,        	null: false
      t.string	  :phone_number,      unique: true
      t.string	  :profile
      t.timestamps
    end
  end
end
