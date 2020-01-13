class Comment < ApplicationRecord
  belongs_to :post
  validates :commenter, presence: true, length: {minimum: 5, maximum: 30}
  validates :body, presence: true, length: {minimum: 10, maximum: 255}
  validate :comment_valid

  def comment_valid
    if commenter.to_s.length < 5
      self.errors[:base] << " lenght Must be greater then 5"

    elsif body.to_s.length < 10
      self.errors[:base] << " body length Must greater then 10 "
    end
  end
end
