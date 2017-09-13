require 'rack-livereload'

Dir.chdir('../../slides')

use Rack::ContentLength
use Rack::LiveReload
use Rack::Static, index: 'slides.html'

app = Rack::Directory.new Dir.pwd

run app
