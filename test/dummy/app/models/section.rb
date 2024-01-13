class Section < ApplicationRecord
  include Shared

  belongs_to :course
  belongs_to :parent, class_name: "Section", optional: true
  has_many :sections, foreign_key: :parent_id, dependent: :destroy
  has_many :lessons, dependent: :destroy

  scope :sorted, -> { order(arel_table[:position].asc) }
  scope :top, -> { where(parent_id: nil) }

  def depth
    parent ? parent.depth + 1 : 0
  end
end
