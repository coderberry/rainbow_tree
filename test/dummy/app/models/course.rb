class Course < ApplicationRecord
  include Shared

  has_many :sections, dependent: :destroy
  has_many :lessons, through: :sections
end
