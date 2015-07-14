require 'packetfu'
require_relative 'packet'
require_relative 'visitors'
require_relative 'visitors/basic'
require_relative 'visitors/dns'


$opts = { iface: PacketFu::Utils.whoami?[:iface] }

def banner
    puts "[+] Ritm tool v1.0 on interface #{$opts[:iface]} (filter : #{ARGV[0] || "None"})"
end


def sniff iface,filter: ""
    capture = PacketFu::Capture.new(iface: iface, start: true,filter: filter)
    visitor = Visitor::PacketVisitor::Basic.new
    dns = Visitor::PacketVisitor::DNS.new
    capture.stream.each do |p|
        pkt = PacketFu::Packet.parse p
        pkt.accept visitor
        pkt.accept dns
    end
end

filter = ARGV[0] || ""
banner
sniff $opts[:iface],filter: filter
