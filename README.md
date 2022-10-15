# HTTP Server in Ruby from scratch
I want to build something like puma, thin or unicorn which can listen on a TCP socket 
for messages ,for those messages parse the HTTP protocol out of it, and then send HTTP responses.

## How TCP connection is working behind the scenes?
We are sending and receiving **text** between servers and it just have to be read in a specific format called "the HTTP protocol"

(run) -->
  - Starts a new thread for each connection.
  - Checks for files locally and serves them up if they exists 


