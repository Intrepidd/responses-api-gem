require_relative '../../api_request'

module ResponsesApi
  class FormRequest < APIRequest
    def form
      Form.from_response(json)
    end

    def error_code
      json.fetch(:code)
    end

    def invalid_form?
      @response.code == 400 && %w[VALIDATION_ERROR BAD_REQUEST INVALID_JSON].include?(error_code)
    end

    def unauthorized?
      @response.code == 401
    end

    def payment_required?
      @response.code == 402
    end

    def forbidden?
      @response.code == 403
    end

    def not_found?
      @response.code == 404
    end

    def conflict?
      @response.code == 409
    end

    def service_unavailable?
      @response.code == 502 || @response.code == 503
    end

    def last_modified
      Time.parse(@response.headers[:last_modified])
    end
  end
end
