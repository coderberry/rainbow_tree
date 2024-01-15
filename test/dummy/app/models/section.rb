# frozen_string_literal: true

class Section < ApplicationRecord
  include Shared
  include RainbowTree::TreeNode

  belongs_to :course
  belongs_to :parent, class_name: "Section", optional: true
  has_many :sections, foreign_key: :parent_id, dependent: :destroy
  has_many :lessons, dependent: :destroy

  scope :sorted, -> { order(arel_table[:position].asc) }
  scope :top, -> { where(parent_id: nil) }

  rainbow_tree root_relation: :course,
    parent_relation: :parent,
    children_relations: [:sections],
    position_key: :position,
    top_scope: :top,
    sorted_scope: :sorted,
    depth_method: :depth

  def depth
    parent ? parent.depth + 1 : 0
  end
end
