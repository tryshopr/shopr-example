module Shoppe
  class Comment < ActiveRecord::Base
    self.table_name = 'shoppe_comments'
 
    belongs_to :commentable, polymorphic: true    
    validates_presence_of :comment, :title, :commenter
  end
 end