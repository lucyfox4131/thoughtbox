class Link < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :url, presence: true
  validates_format_of :url, :with => /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i
end
