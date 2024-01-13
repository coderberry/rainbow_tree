class Lesson < ApplicationRecord
  include Shared

  belongs_to :section

  scope :sorted, -> { order(arel_table[:position].asc) }

  def course
    section.course
  end

  def depth
    section.depth + 1
  end
end
