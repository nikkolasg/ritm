require 'packetfu'
include PacketFu
iface =PacketFu::Utils.whoami?[:iface]
puts "Interface : " + iface

capture = Capture.new(iface: iface, start: true)
capture.stream.each do |p|
    pkt = Packet.parse p
    next unless pkt.is_ip?
    packet_info = [pkt.ip_saddr,pkt.ip_daddr,pkt.size,pkt.proto.last]
    puts "%s -> %s (%s bytes) %s" % packet_info
end

