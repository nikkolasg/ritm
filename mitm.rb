require 'packetfu'
require_relative 'listeners/basic'

include PacketFu

$opts = { iface: PacketFu::Utils.whoami?[:iface] }

def banner
    puts "[+] Ritm tool v1.0 on interface #{$opts[:iface]}"
end


def sniff iface
    capture = Capture.new(iface: iface, start: true)
    capture.stream.each do |p|
        pkt = Packet.parse p
        base_info pkt
        
    end
end

def base_info pkt
    return unless pkt.is_ip?
    packet_info = [pkt.ip_saddr,pkt.ip_daddr,pkt.size,pkt.proto.last]
    puts "%s -> %s (%s bytes) %s" % packet_info
end

banner
sniff $opts[:iface]
