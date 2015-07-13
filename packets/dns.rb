require 'packetfu'
require_relative 'packet'

## DNS Packet abstraction 
#

module PacketFu

    # Taken from 
    # http://www.tcpipguide.com/free/t_DNSMessageHeaderandQuestionSectionFormat.htm

    class DNSHeader < Struct.new(:id,:qr,:opcode,:aa,:tc,:rd,:ra,:rcode,:qdcount,:ancount,:nscount,:arcount)

    end

end
