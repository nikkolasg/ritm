require_relative '../visitors'

module Visitor

    module PacketVisitor

        class DNSPoof

            include PacketVisitor

            def new_packet packet
            end
        end
    end
end
