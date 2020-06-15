class MatchValidator < ActiveModel::Validator
  def validate(record)
    puts record.title
    unless !!record.title && record.title.match?(/Won't Believe|Secret|Top [0-9]+|Guess/)
      record.errors[:title] << "Not clickbait"
    end
  end
end

class Post < ActiveRecord::Base

  include ActiveModel::Validations

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]  }
  validates_with MatchValidator
end
