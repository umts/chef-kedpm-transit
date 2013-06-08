maintainer       "UMass Transit Service"
maintainer_email "transit-mis@admin.umass.edu"
license          "All rights reserved"
description      "Installs/Configures chef-kedpm-transit"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

depends "kedpm"
depends "rsnapshot"
