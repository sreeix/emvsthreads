require "fiber"
require "em-synchrony"
require "em-synchrony/em-http"

class EmSynFu
  def do(urls)
    EM.synchrony do
      multi = EventMachine::Synchrony::Multi.new
      urls.each{|url| print(url);multi.add( :page1, EventMachine::HttpRequest.new(url).aget); print '.'}
      multi.perform.responses[:callback]
      EventMachine.stop
    end
  end
end