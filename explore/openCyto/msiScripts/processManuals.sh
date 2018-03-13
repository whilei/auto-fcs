 #!/usr/bin/env bash 



 cat manualWSPs.txt | sed "s/.*\///g"|sed "s/.fcs.*//g"|sed "s/.wsp.*//g"|pbcopy