#!/usr/bin/env ruby
arg = ARGV[0] || 'run'
rubies = ['ruby-1.8.7-p334', 'ree-1.8.7-2011.03', 'jruby-1.6.3', 'ruby-1.9.2-p290', 'ruby-1.9.2-p180']

if arg == 'setup'
  rubies.each do |r| 
    puts "Installing #{r}" 
    system "rvm install #{r}"
    system "rvm use #{r}@tmp --create"
    system "gem install bundler && bundle install"
  end
else
  rubies.each do |r|
    system "rvm #{r}@tmp exec bundle exec ruby fubar.rb"
  end
end
