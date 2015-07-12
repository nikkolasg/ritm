require 'packetfu'
require 'visitors'

## A module responsible to add a few utils function
## to the packetfu packet class...
module PacketDecorator

    @sent = false
    
    ## decorator to_w 
    # if it has already been sent before no need
    # if we want to force it we can ;)
    def send_to iface,force: false
        to_w iface unless @sent || !force
        @sent = true
    end
    
    def sent?
        @sent
    end
    
    ## No need to pass it along any more if it return true
    def finished?
        @finished
    end

    def finished
        @finished = true
    end
end

class PacketFu::Packet
    
    include PacketDecorator
    include Visitable
end
