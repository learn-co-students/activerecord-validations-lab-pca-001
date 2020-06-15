class TitleValidator < ActiveModel::Validator
  def validate(record)
    unless valid_title?(record)
      record.errors[:title] << "Must include a clickbaity title"
    end
  end

  private

    def valid_title?(record)
      return false if record.title.nil?
      ["Won't Believe", "Secret", "Top [number]", "Guess"].any? do |string|
        record.title.include?(string)
      end
    end
end
