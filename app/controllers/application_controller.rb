# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :failed_validation

  private

  def failed_validation(exception)
    render json: exception.message, status: :bad_request
  end
end
