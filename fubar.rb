require 'benchmark'
require './em_fu'
require './thread_fu'
sites = ['http://gdata.youtube.com/feeds/api/videos/agCqQFHFf2g', 
         'http://www.yahoo.com', 'http://www.facebook.com', 
         'http://www.twitter.com', 
         'http://www.cnn.com',
         'http://www.bbc.co.uk',
         'http://www.techcrunch.com',
         'http://news.ycombinator.com',
         'http://www.bloomberg.com',
         'http://www.reuters.com',
         'http://github.com',
         'http://www.datastax.com',
         'http://www.wikipedia.org',
         'http://beginrescueend.com',
         'http://www.couchbase.com',
         'http://livingforwards.wordpress.com',
         'http://www.apple.com',
         'http://www.oracle.com',
         'http://www.economist.com',
         'http://www.apache.org/',
         'http://www.ruby-lang.org/en/',
         'http://www.scala-lang.org/',
         'http://www.activesphere.com',
         'http://www.thehindu.com',
         'http://www.cs.cmu.edu/',
         'http://www.heroku.com',
         'http://news.bbc.co.uk',
         'http://money.cnn.com',
         'http://www.mphoria.com',
         'http://www.csail.mit.edu/']

Benchmark.bmbm do |b|
  b.report("Threads") {ThreadFu.new.do(sites)}
  b.report("Simple EM") {EmFu.new.do(sites)} unless RUBY_PLATFORM =~ /jruby/
end

