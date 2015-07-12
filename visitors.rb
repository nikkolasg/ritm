## Visitor pattern design 
## mostly taken from http://blog.bigbinary.com/2013/07/07/visitor-pattern-and-double-dispatch.html
require 'packetfu'

## abstraction to the visitor pdeisgn pattern
module Visitor

    ## specification for the packets
    module PacketVisitor

        ## check packet before relaying to actual analysis
        def visit packet
            check packet
            new_packet packet
        end

        def check packet
            raise "[-] Received a wrong input to visit." if packet.is_nil? || packet.is_a?(PacketFu::InvalidPacket)
        end

        def base_info pkt
            return unless pkt.is_ip?
            packet_info = [pkt.ip_saddr,pkt.ip_daddr,pkt.size,pkt.proto.last]
            return "%s -> %s (%s bytes) %s" % packet_info
        end

    end

end

module Visitable

    def accept visitor
        visitor.visit self
    end

end
