module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    # Define custom handler
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_four
  end

  private

  # JSON response with message, Status code 422 - unprocessable_entity
  def four_twenty_four(error)
    json_response({ errors: error }, :unprocessable_entity)
  end
end
