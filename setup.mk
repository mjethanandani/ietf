# THIS MAKFILE IS GENERATED

PACKAGES = bgp l2vpn evpn

NETWORK = 

.PHONY: packages packages-clean
packages:
	(for i in $(PACKAGES); do \
	        $(MAKE) -C packages/$${i}/src all || exit 1; \
	done)

packages-clean:
	(for i in $(PACKAGES); do \
	        $(MAKE) -C packages/$${i}/src clean || exit 1; \
	done)

