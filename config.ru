require_relative 'middleware/logger'
require_relative 'config/environment'

use Rack::Reloader, 0
use AppLogger, logdev: File.expand_path('log/app.log', __dir__)
run Simpler.application
