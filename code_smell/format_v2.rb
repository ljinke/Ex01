module Mobile
  class Format
    def initialize(application)
      @application = application
    end
    def call(environment)
      request = Rack::Request.new(environment)
      set_mobile_accept_header(request) if serve_mobile?(request)
      response = response(request)
      response.finish
    end
    private
    def user_agent(request)
      Mobile::UserAgent.new(request.env['HTTP_USER_AGENT'])
    end
    def mobile_requested?(request)
      request.params['mobile'] == '1'
    end
    def serve_mobile?(request)
      mobile_requested?(request) || user_agent(request).mobile?
    end
    def set_mobile_accept_header(request)
      request.env['HTTP_ACCEPT'] = 'text/html+mobile'
    end
    def response(request)
      status, headers, body = @application.call(request.env)
      Rack::Response.new(body, status, headers)
    end
  end
end