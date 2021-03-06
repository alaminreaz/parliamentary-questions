# == Schema Information
#
# Table name: watchlist_members
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  deleted    :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#

class WatchlistMember < ActiveRecord::Base
  extend  SoftDeletion::Collection
  include SoftDeletion::Record

  has_paper_trail
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, on: :create
  validates_format_of :email,:with => Devise::email_regexp

	before_validation Validators::Whitespace.new
end
