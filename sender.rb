#!/usr/bin/env ruby
require 'bunny'

connection = Bunny.new
connection.start

channel = connection.create_channel

queue = channel.queue('hello')

channel.default_exchange.publish('Hello World! x2', routing_key: queue.name)
puts " [x] Sent 'Hello World!'"

connection.close

