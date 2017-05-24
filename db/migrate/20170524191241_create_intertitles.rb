class CreateIntertitles < ActiveRecord::Migration
  def change
    create_table :intertitles do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
