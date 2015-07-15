# ritm
Ruby in the middle 
Like Mitmf but my own in ruby ;)


The idea is to collect "all packets" (aka no pcap filter) then to have
a dispatcher that will forward the packets to differents plugins.
Each plugins registers what kind of packets they need. for example,
we could implement sslstrip+ (one of the goal actually), by registering the plugin
and telling the dispatcher we want all DNS packet + HTML packet. That way the plugin will
be able to make the DNS spoofing and to make the change in the HTML packets.

Design would be as follow :
                Plugin

                 - launch args = {}

        
        DNSSpoofPlugin            SSLStripPlugin

For plugins that only listen for packets (like password sniffer),


and we have a Dispatcher.

So we can do things like :

sslstrip            dnsspoof            dispatcher           listener (pcap)

        -------->                                   <--------
        launch dns                                  <--------
                            --------->
                            register DNS               ..... 

        ------------------------------>             <--------
        register Http

                              <---------
                              DNS packet

        <------------------------------
        http packet


Every plugin should be "launchable" with parameters so others plugin can use them 


Technicalities:
 MRI / Rubinius / JRuby?

 - MRI dead because of poor multithreading (GLI)
 - Rubinius is a nice alternative (fast and safe)
 - JRuby seems Better even though a little overhead compared to Rubinius (due to JVM)
        -> access to JVM JAVA libraries
        -> CROSS PLATFORMS !!!!! THAT's GREAT !! ==> window, mac, android
        -> can be compiled as a standalone JAR (or japplet or whatever)
            --> can be used as a library !!

