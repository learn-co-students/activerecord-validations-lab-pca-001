require "pry"
class TitleValidator < ActiveModel::Validator
  def validate(record)
    unless valid_title?(record)
      record.errors[:title] << "Not a valid title."
    end
  end

  private

  def valid_title?(record)
    return false if record.title.nil?

    valid_titles = ["Won't Believe", "Secret", "Top", "Guess"]
    valid_titles.any? { |words| record.title.include?(words) }
  end
end
