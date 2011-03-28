# Inherit AOSP device configuration for supersonic.
$(call inherit-product, device/htc/supersonic/supersonic.mk)

# Inherit some common savagedzen stuff.
$(call inherit-product, vendor/savagedzen/products/common_full.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := savagedzen_supersonic
PRODUCT_BRAND := sprint
PRODUCT_DEVICE := supersonic
PRODUCT_MODEL := PC36100
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=FRF91 BUILD_DISPLAY_ID=GRI40 PRODUCT_NAME=htc_supersonic BUILD_FINGERPRINT=sprint/htc_supersonic/supersonic/supersonic:2.2/FRF91/252548:user/release-keys PRIVATE_BUILD_DESC="3.29.651.5 CL252548 release-keys"

# Build kernel
#PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel-msm
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=EVO-CFS-HAVS-GB

# Extra Supersonic overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/savagedzen/overlay/supersonic

#
# Set ro.modversion
#
ifdef SAVAGEDZEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=SavagedZen(MOD)-RC2-$(shell date +%m%d%Y)-NIGHTLY-Evo4G
else
    ifdef SAVAGEDZEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=SavagedZen(MOD)-RC2-Evo4G
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=SavagedZen(MOD)-RC2-Evo4G
    endif
endif

#
# Copy passion specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/savagedzen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
