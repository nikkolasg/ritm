require_relative '../visitors'
module Visitor
module PacketVisitor 

    class Basic 
         
        include PacketVisitor
      
        def new_packet packet
            return nil if packet.finished?
            puts "[+] Basic visitor : #{base_info packet}"
            return true
        end

    end

end
end
