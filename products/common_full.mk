# Inherit common CM stuff
$(call inherit-product, vendor/savagedzen/products/common.mk)

# Bring in all audio files
include frameworks/base/data/sounds/AllAudio.mk

# Theme packages
include vendor/savagedzen/products/themes.mk

# Default ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Playa.ogg \
    ro.config.notification_sound=regulus.ogg \
    ro.config.alarm_alert=Alarm_Beep_03.ogg
