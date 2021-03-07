module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    # Define custom handler
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ActiveRecord::RecordNotFound, with: :four_zero_four
  end

  private

  # JSON response with message, Status code 422 - unprocessable_entity
  def four_twenty_two(error)
    json_response({ errors: error }, :unprocessable_entity)
  end

  # JSON response with message, Status code 404 - not_found
  def four_zero_four(error)
    json_response({ errors: error }, :not_found)
  end
end
