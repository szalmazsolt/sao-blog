class BlogPost < ApplicationRecord

  validates :title, presence: true
  validates :body, length: { minimum: 3 }

  def self.latest_first
    order("created_at desc")
  end


end
