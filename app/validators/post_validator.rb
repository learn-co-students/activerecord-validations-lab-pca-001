class PostValidator < ActiveModel::Validator
  def validate(post)
    title_array = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    unless title_array.any? {|t| post.title.include? (t)}
        errors.add(:title, "must be clickbait-y")
    end
  end
end