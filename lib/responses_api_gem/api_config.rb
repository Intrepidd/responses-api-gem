module ResponsesApi
  class APIConfig
    def self.token
      ENV['TYPEFORM_API_TOKEN']
    end

    def self.image_api_request_url
      'https://images.typeform.com'
    end

    def self.workspaces_api_request_url
      'https://api.typeform.com/workspaces'
    end

    def self.api_request_url
      'https://api.typeform.com'
    end
  end
end
