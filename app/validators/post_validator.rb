class PostValidator < ActiveModel::Validator
  def validate(record)
    unless valid?(record)
      record.errors[:title] << "Not a valid title."
    end
  end

  def valid?(record)
    return false if record.title.nil?
    valid_titles = ["Won't Believe", "Secret", "Top", "Guess"]
    valid_titles.any? { |words| record.title.include?(words) }
  end
end
