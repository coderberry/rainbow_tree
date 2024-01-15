# frozen_string_literal: true

class Lesson < ApplicationRecord
  include Shared
  include RainbowTree::TreeNode

  belongs_to :section

  scope :sorted, -> { order(arel_table[:position].asc) }

  rainbow_tree(
    parent_key: :section_id
  )

  def course
    section.course
  end

  def depth
    section.depth + 1
  end
end
