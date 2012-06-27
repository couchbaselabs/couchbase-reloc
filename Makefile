# Makes a relocatable tarball.
#
# requirements:
#    centos x86_64 system & root user
#
# usage:
#    make reloc
#
# output:
#    couchbase-server-community_x86_64_1.8.1-937-rel-reloc.tar.gz
#
EDITION=community
VERSION=1.8.1-937

PACKAGE_BASE=couchbase-server-$(EDITION)_x86_64_$(VERSION)-rel
PACKAGE=$(PACKAGE_BASE).rpm

URL_BASE=http://builds.hq.northscale.net/latestbuilds
URL=$(URL_BASE)/$(PACKAGE)

reloc:
	rpm -e couchbase-server || true
	rm -rf /opt/couchbase
	rm -f $(PACKAGE)
	wget $(URL)
	rpm -i $(PACKAGE)
	sleep 5
	/etc/init.d/couchbase-server stop
	sleep 5
	rm -f /opt/couchbase/var/lib/couchbase/config/config.dat
	sed -e "s,chown bin:bin,echo relocating,g" /opt/couchbase/bin/reloc.sh > /tmp/reloc.sh
	cp /tmp/reloc.sh /opt/couchbase/bin/reloc.sh
	tar -C /opt -czvf $(PACKAGE_BASE)-reloc.tar.gz couchbase
