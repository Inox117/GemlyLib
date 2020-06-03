class Book < ApplicationRecord
  include Filterable
  validates :title, presence: true,
                    length: {minimum: 1}
  scope :filter_by_isbn_10, -> (isbn10) { where("isbn10 LIKE ?", isbn10)}
  scope :filter_by_isbn_13, -> (isbn13) { where("isbn13 LIKE ?", isbn13)}
  scope :filter_by_title, -> (title) { where("lower(title) LIKE ?", "%#{title}%")}
end
