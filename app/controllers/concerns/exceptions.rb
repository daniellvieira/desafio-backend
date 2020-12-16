module Exceptions
  extend ActiveSupport::Concern

  included do
    rescue_from ActionController::InvalidAuthenticityToken, with: :invalid_token
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from PG::RaiseException, with: :pg_raise
    rescue_from RuntimeError, with: :runtime_error

    def invalid_token
      render_error('Invalid Authenticity Token.')
    end

    def not_found
      render_error('Registro não encontrado.')
    end

    def pg_raise(error)
      render_error(error)
    end

    def runtime_error(error)
      render_error(error)
    end
    
    def render_error(message)
      redirect_back fallback_location: root_path, flash: { error: message }
    end
  end
end
