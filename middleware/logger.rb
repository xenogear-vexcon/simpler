require 'logger'

class AppLogger

  def initialize(app, **options)
    @logger = Logger.new(options[:logdev] || STDOUT)
    @app = app
  end

  def call(env)
    response = @app.call(env)
    @logger.info(message(env))
    
    response
  end

  private

  def message(env)
    "Request: #{env['REQUEST_METHOD']} #{env['REQUEST_URI']} | " \
    "Handler: #{env['simpler.controller'].class}##{env['simpler.action']} | " \
    "Parameters: #{env['simpler.params']} | " \
    "Response: #{env['simpler.status']} [#{env['simpler.header']}] #{env['simpler.template']} |" \
  end
  
end