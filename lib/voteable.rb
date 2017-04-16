=begin
module Voteable
  extend ActiveSupport::Concern

  #This code gets executed whenever the module is being included
  included do
    has_many :votes, as: :voteable
  end

  def total_votes
    up_votes - down_votes
  end

  def up_votes
    self.votes.where(vote: true).size
  end

  def down_votes
    self.votes.where(vote: false).size
  end

end
=end