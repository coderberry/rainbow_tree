module Shared
  extend ActiveSupport::Concern

  included do
    validates :title, presence: true

    scope :draft, -> { where(published_at: nil) }
    scope :published, -> { where(arel_table[:published_at].lteq(Time.current)) }
    scope :scheduled, -> { where(arel_table[:published_at].gt(Time.current)) }
  end

  # @return [String] "draft", "scheduled", or "published"
  def status
    if published_at.nil?
      "draft"
    elsif published_at > Time.current
      "scheduled"
    else
      "published"
    end
  end
end
