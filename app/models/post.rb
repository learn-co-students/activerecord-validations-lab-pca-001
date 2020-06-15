class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  validate :validate

  def validate
      title_array = ["Won't Believe", "Secret", "Top [number]", "Guess"]
      if self.title
          unless title_array.any? {|t| self.title.include? (t)}
              errors.add(:title, "must be clickbait-y")
          end
      end
  end
end