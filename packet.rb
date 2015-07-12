require 'packetfu'

module PacketDecorator

    @sent = false
    
    ## decorator to_w 
    def send iface,force: false
        to_w iface unless @sent || !force
        @sent = true
    end
    
    def sent?
        @sent
    end

    def finished?
        @finished
    end

    def finished
        @finished = true
    end
end

class PacketFu::Packet
    
    include PacketDecorator

end
