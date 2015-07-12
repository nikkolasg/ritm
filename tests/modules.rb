require 'packetfu'
module Decorator
    
    @sent = false

    def send
        wire unless @sent
        @sent = true
    end

end

class PacketFu::Packet

    include Decorator
    
    def wire
       puts "packet being sent.." 
    end

end


p = PacketFu::TCPPacket.new

p.send
p.send
