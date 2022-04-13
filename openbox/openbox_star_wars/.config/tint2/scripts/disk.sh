    #!/bin/bash

    hdd="$(df -h | awk 'NR==4{print $5}')"
    icon=" "
    printf "$icon""$hdd"
