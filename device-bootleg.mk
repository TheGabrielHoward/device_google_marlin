# UI
PRODUCT_PROPERTY_OVERRIDES += \
    sys.use_fifo_ui=1

# IMS
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager.xml \
    com.android.ims.rcsmanager \
    RcsService \
    PresencePolling

# Tethering
PRODUCT_PROPERTY_OVERRIDES += \
    net.tethering.noprovisioning=true

# Update engine
PRODUCT_PACKAGES += brillo_update_payload
