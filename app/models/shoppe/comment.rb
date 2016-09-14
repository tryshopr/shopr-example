module Shopr
  class Comment < ActiveRecord::Base
    self.table_name = 'shopr_comments'
 
    belongs_to :commentable, polymorphic: true    
    validates_presence_of :comment, :title, :commenter
  end
 end