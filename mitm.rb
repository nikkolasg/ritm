require 'packetfu'
require_relative 'packet'
require_relative 'visitors'
require_relative 'visitors/basic'
include PacketFu

$opts = { iface: PacketFu::Utils.whoami?[:iface] }

def banner
    puts "[+] Ritm tool v1.0 on interface #{$opts[:iface]}"
end


def sniff iface
    capture = Capture.new(iface: iface, start: true)
    visitor = Visitor::PacketVisitor::Basic.new
    capture.stream.each do |p|
        pkt = Packet.parse p
        pkt.accept visitor
    end
end

banner
sniff $opts[:iface]
