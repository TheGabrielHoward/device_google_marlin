# UI
PRODUCT_PROPERTY_OVERRIDES += \
    sys.use_fifo_ui=1

# IMS
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager.xml \
    com.android.ims.rcsmanager \
    RcsService \
    PresencePolling
    
#Permissons
PRODUCT_PROPERTY_OVERRIDES += \
    ro.control_privapp_permissions=log \
    ro.adb.secure=0 \
    persist.sys.usb.config=mtp,adb \
    persist.service.debuggable=1 \
    persist.service.adb.enable=1

# VoLTE
PRODUCT_PROPERTY_OVERRIDES += \
    persist.dbg.ims_volte_enable=1 \
    persist.dbg.volte_avail_ovr=1 \
    persist.dbg.vt_avail_ovr=1 \
    persist.dbg.wfc_avail_ovr=1 \
    persist.radio.rat_on=combine \
    persist.radio.data_ltd_sys_ind=1 \
    persist.radio.data_con_rprt=1 \
    persist.radio.calls.on.ims=1

# Tethering
PRODUCT_PROPERTY_OVERRIDES += \
    net.tethering.noprovisioning=true

# Update engine
PRODUCT_PACKAGES += brillo_update_payload

# nexus.xml
PRODUCT_COPY_FILES += \
    device/google/marlin/nexus.xml:system/etc/sysconfig/nexus.xml

# Google Assistant
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.opa.eligible_device=true

PRODUCT_ENFORCE_RRO_TARGETS := \
    framework-res
