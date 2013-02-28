class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_votes

  validate :link_format

  def user_voted?(current_user_id)
    self.post_votes.map {|post_vote| post_vote.user_id}.include?(current_user_id)
  end

  private

  def link_format
    link = URI.parse(self.link)
    self.errors.add(:link, "Invalid URL please go back and try again") unless link.kind_of?(URI::HTTP)
  end

end
