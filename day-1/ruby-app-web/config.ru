require_relative 'lib/app.rb'
require_relative 'lib/contact.rb'
require_relative 'lib/timer.rb'

routes = Rack::Builder.new do
  map '/' do
    use Neticoa::Timer, app: 'home'
    run MonApplication.new
  end

  map '/contact' do
    use Neticoa::Timer, app: 'contacts'
    run MonContact.new
  end
end

run routes
