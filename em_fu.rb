require 'eventmachine'
require 'em-http'
class EmFu
  def do(urls)
    num_urls = urls.size - 1 
    EM.run do
      urls.each do |url|
        http = EventMachine::HttpRequest.new(url).get
        http.callback {EM.stop if num_urls == 0; num_urls -= 1 }
        http.errback {EM.stop if num_urls == 0; num_urls -= 1 }
      end
    end
  end
end