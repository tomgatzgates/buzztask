# frozen_string_literal: true

class ActiveRecordErrorSerializer
  def initialize(model)
    @model = model
  end

  def serialized_json
    ar_errors.flatten.uniq
  end

  private

  def ar_errors
    @model.errors.messages.map do |field, errors|
      errors.map.with_index do |error_message, index|
        {
          source: { pointer: "/data/attributes/#{field}" },
          code: @model.errors.details[field][index][:error],
          title: error_message,
          detail: @model.errors.full_messages_for(field)[index],
        }
      end
    end
  end
end
