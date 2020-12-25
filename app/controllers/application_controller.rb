class ApplicationController < ActionController::Base

    skip_before_action :verify_authenticity_token

    # rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    # rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    # rescue_from UserIsNotAnAdmin, with: :render_error_response
  
    # def render_unprocessable_entity_response(exception)
    #   render json: {
    #     message: "Validation Failed",
    #     errors: ValidationErrorsSerializer.new(exception.record).serialize
    #   }, status: :unprocessable_entity
    # end
  
    # def render_not_found_response
    #   render json: { message: "Not found", code: "not_found" }, status: :not_found
    # end
    
    # def render_error_response(exception)
    #   render json: { message: exception.message, code: exception.code }, status: exception.http_status
    # end

end
