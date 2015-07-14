require_relative '../visitors'
module Visitor
    module PacketVisitor

        class DNS

            include PacketVisitor

            def new_packet packet
                op = packet.payload[2].unpack("B*")[0][0..4] 
                if op == "00000" 
                    query = "query"
                elsif op == "10000"
                    query = "response"
                end
                puts "[+] DNS visitor : (#{op})" + query 
                return true
            end
        end
    end
end
