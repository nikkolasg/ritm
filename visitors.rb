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
            raise "[-] Received a wrong input to visit." if packet.valid? 
        end

        def base_info pkt
            return pkt.peek_format
        end

    end

end

module Visitable

    def accept visitor
        visitor.visit self
    end

end
