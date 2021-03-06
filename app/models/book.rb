class Book < ApplicationRecord
  has_many :rental_books, dependent: :destroy
  has_many :members,   through: :rental_book

  def self.rentable_books
    all.select do |book|
      book.rentable?
    end
  end

  def rentable?
    rental_books.blank?
  end
end
