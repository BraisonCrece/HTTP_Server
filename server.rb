require 'socket'
require 'active_support/all'
require_relative 'request'
require_relative 'response'

# define a empty port
port = ENV.fetch('PORT', 2001).to_i
# initialize a new server on defined port
server = TCPServer.new port

puts "Listening on port #{port}..."






def render(path)
  full_path = File.join(__dir__, 'views', path)

  if File.exists?(full_path)
    Response.new(code: 200, body: File.binread(full_path))
  else
    Response.new(code: 404)
  end
end

def route(request)
  if request.path == '/'
    render 'index.html'
  else
    render request.path
  end
end

loop do
  # every time we accept a new connection to the server
  # we start a new thread 
  Thread.start(server.accept) do |client|
    request = Request.new client.readpartial(2048)
    
    response = route(request)
    response.send(client)
    
    client.close
  end
end