module Mobile
  class Format
    def initialize(application)
      @application = application
    end
    def call(environment)
      request = Rack::Request.new(environment)
      user_agent = ::Mobile::UserAgent.new(request.env['HTTP_USER_AGENT'])
      if request.params['mobile'] == '1' || user_agent.mobile?
        request.env['HTTP_ACCEPT'] = 'text/html+mobile'
      end
      status, headers, body = @application.call(request.env)
      response = Rack::Response.new(body, status, headers)
      response.finish
    end
  end
end