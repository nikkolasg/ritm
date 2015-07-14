require_relative '../visitors'
module Visitor
    module PacketVisitor

        class DNS

            include PacketVisitor

            def new_packet packet
                puts "[+] DNS visitor : #{packet.payload}"
                return true
            end
        end
    end
end
