class CreateAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :answers do |t|
      t.references :occasion, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :myoccasion
      t.integer :recipient
      t.integer :gift
      t.integer :user
      t.text :favorites
      t.text :hobbies
      t.text :movies
      t.text :music
      t.text :books
      t.text :restaurant
      t.text :activities
      t.text :channels
      t.text :contents, array: true
      t.text :brands, array: true
      t.text :places, array: true
      t.text :socials, array: true
      t.text :onlines, array: true
      t.text :purchases, array: true
      t.text :communications, array: true
      t.text :apps, array: true
      t.text :websites, array: true
      t.text :locations, array: true
      t.text :devices, array: true
      t.text :softwares, array: true
      t.text :games, array: true
      t.text :platforms, array: true
      t.timestamps
    end
  end
end
