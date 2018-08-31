module Shopr
  class Comment < ApplicationRecord
    self.table_name = 'shopr_comments'

    belongs_to :commentable, polymorphic: true
    validates :comment, :title, :commenter, presence: true
  end
 end
