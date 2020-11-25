################################################################################
#
# acme crontab
#
################################################################################

ACMESH_CRONTAB_VERSION = 1.0
ACMESH_CRONTAB_SITE = "$(BR2_EXTERNAL_VPN_PI_PATH)/source/acmesh-crontab/"
ACMESH_CRONTAB_SITE_METHOD = local
ACMESH_CRONTAB_LICENSE = GPL-3.0+
ACMESH_CRONTAB_LICENSE_FILES = COPYING

define ACMESH_CRONTAB_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0644 $(@D)/root_crontab $(TARGET_DIR)/var/spool/cron/crontabs/root
endef

$(eval $(generic-package))
