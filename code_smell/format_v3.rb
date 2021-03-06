module Mobile
  class Format
    def initialize(application)
      @application = application
    end
    def call(environment)
      @environment = environment
      set_mobile_accept_header if serve_mobile?
      response.finish
    end
    private
    def request
      @request ||= Rack::Request.new(@environment)
    end
    def user_agent
      Mobile::UserAgent.new(request.env['HTTP_USER_AGENT'])
    end
    def mobile_requested?
      request.params['mobile'] == '1'
    end
    def serve_mobile?
      mobile_requested? || user_agent.mobile?
    end
    def set_mobile_accept_header
      request.env['HTTP_ACCEPT'] = 'text/html+mobile'
    end
    def response
      status, headers, body = @application.call(request.env)
      Rack::Response.new(body, status, headers)
    end
  end
end