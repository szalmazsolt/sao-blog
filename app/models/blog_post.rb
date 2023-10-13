class BlogPost < ApplicationRecord

  has_rich_text :content

  validates :title, presence: true
  validates :content, length: { minimum: 3 }

  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.now) }
  scope :scheduled, -> { where("published_at > ?", Time.now) }
  # scope :latest_first, -> { order("updated_at DESC") }
  scope :sort_by_status, -> { order("published_at DESC NULLS FIRST") }

  def draft?
    published_at.nil?
  end

  def published?
    published_at? && published_at <= Time.now
  end

  def scheduled?
    published_at? && published_at > Time.now
  end

end
