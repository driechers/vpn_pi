################################################################################
#
# acme.sh
#
################################################################################

ACMESH_VERSION = 02baa778c5a9537a133fb009b80c69300802af6c
ACMESH_SITE = "https://github.com/acmesh-official/acme.sh.git"
ACMESH_SITE_METHOD=git
ACMESH_LICENSE = GPL-3.0+
ACMESH_LICENSE_FILES = COPYING

define ACMESH_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/acme.sh $(TARGET_DIR)/usr/bin/acme.sh
    cp -r $(@D)/deploy $(TARGET_DIR)/usr/bin/
    cp -r $(@D)/dnsapi $(TARGET_DIR)/usr/bin/
    cp -r $(@D)/notify $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
