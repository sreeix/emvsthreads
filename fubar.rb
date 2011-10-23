require 'benchmark'
require './em_fu'
require './thread_fu'
sites = ['http://gdata.youtube.com/feeds/api/videos/agCqQFHFf2g', 'http://www.yahoo.com', 'http://www.facebook.com', 'http://www.twitter.com', 'http://www.cnn.com','http://www.bbc.co.uk',
  'http://www.techcrunch.com', 'http://news.ycombinator.com','http://www.bloomberg.com','http://www.reuters.com']

Benchmark.bmbm do |b|
  b.report("Threads") {ThreadFu.new.do(sites)}
  b.report("Simple EM") {EmFu.new.do(sites)}
end

