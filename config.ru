require 'bundler/setup'
Bundler.require(:default)

require File.join(File.dirname(__FILE__), 'app/base_controller.rb')

require File.join(File.dirname(__FILE__), 'app/index_controller.rb')
map '/' do
	run IndexController
end

require File.join(File.dirname(__FILE__), 'app/cipher_controller.rb')
map '/cipher' do
    run CipherController
end

require File.join(File.dirname(__FILE__), 'app/trace_controller.rb')
map '/trace' do
    run TraceController
end

