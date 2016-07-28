class CreateCommentsTable < ActiveRecord::Migration
   def change
   	drop_table :shoppe_comments
    create_table :shoppe_comments do |t|
     t.text :comment
     t.integer :commentable_id, null: false
     t.string :commentable_type, null: false
     t.string :title
     t.string :commenter
     t.integer :rating, default: 1
     t.timestamps
    end
  end
end
