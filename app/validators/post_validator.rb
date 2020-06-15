class PostValidator < ActiveModel::Validator
  def validate(record)
    valid = ["Won't Believe", "Secret", "Guess"].any? do |string|
      record.title&.include? string
    end

    valid ||= record.title&.match?(/top \d+/)

    record.errors[:title] << "Must include a clickbaity title" unless valid
  end
end
