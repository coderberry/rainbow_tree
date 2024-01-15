# frozen_string_literal: true

class Course < ApplicationRecord
  include Shared
  include RainbowTree::Root

  has_many :sections, dependent: :destroy
  has_many :lessons, through: :sections
end
