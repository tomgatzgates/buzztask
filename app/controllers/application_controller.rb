class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def render_unprocessable_entity_response(exception)
    render status: :unprocessable_entity,
           json: { errors: ActiveRecordErrorSerializer.new(exception.record).serialized_json }
  end
end
