################################################################################
#
# eap-mschapv2-configs
#
################################################################################

EAP_MSCHAPV2_CONFIGS_VERSION = 1.0
EAP_MSCHAPV2_CONFIGS_SITE = "$(BR2_EXTERNAL_VPN_PI_PATH)/source/eap-mschapv2-configs/"
EAP_MSCHAPV2_CONFIGS_SITE_METHOD = local
EAP_MSCHAPV2_CONFIGS_LICENSE = GPL-3.0+
EAP_MSCHAPV2_CONFIGS_LICENSE_FILES = COPYING

define EAP_MSCHAPV2_CONFIGS_INSTALL_TARGET_CMDS
    cp $(@D)/ipsec.conf $(TARGET_DIR)/etc/ipsec.conf

    sed -i "s/LEFT_ID/$(PIKEV2_DOMAIN_NAME)/" $(TARGET_DIR)/etc/ipsec.conf
    sed -i "s/CERT_PATH/\/root\/.acme.sh\/$(PIKEV2_DOMAIN_NAME)\/fullchain.cer/" $(TARGET_DIR)/etc/ipsec.conf

    echo ": RSA /root/.acme.sh/$(PIKEV2_DOMAIN_NAME)/$(PIKEV2_DOMAIN_NAME).key" > $(TARGET_DIR)/etc/ipsec.secrets

    if [ -n $(PIKEV2_USER1) ]; then echo "$(PIKEV2_USER1) : EAP \"$(PIKEV2_PASS1)\"" >> $(TARGET_DIR)/etc/ipsec.secrets; fi
    if [ -n $(PIKEV2_USER2) ]; then echo "$(PIKEV2_USER2) : EAP \"$(PIKEV2_PASS2)\"" >> $(TARGET_DIR)/etc/ipsec.secrets; fi
    if [ -n $(PIKEV2_USER3) ]; then echo "$(PIKEV2_USER3) : EAP \"$(PIKEV2_PASS3)\"" >> $(TARGET_DIR)/etc/ipsec.secrets; fi
endef

$(eval $(generic-package))
