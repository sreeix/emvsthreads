require 'restclient'
class ThreadFu
  def do(urls)
    threads = urls.collect do |url|
      Thread.new { RestClient.get(url) }
    end
    threads.each {|t| t.join}
  end
end