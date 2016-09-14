class CreateCommentsTable < ActiveRecord::Migration
  def up
    create_table :shopr_comments do |t|
     t.text :comment
     t.integer :commentable_id, null: false
     t.string :commentable_type, null: false
     t.string :title
     t.string :commenter
     t.integer :rating, default: 1
     t.timestamps
    end
  end

  def down
    drop_table :shopr_comments
  end

end
