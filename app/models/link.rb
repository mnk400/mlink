class Link < ApplicationRecord
  acts_as_votable
  acts_as_commontable
  
  belongs_to :user
  validates :title, presence: true
  validates :url, presence: true

  def score
  self.get_upvotes.size - self.get_downvotes.size
  end
end
