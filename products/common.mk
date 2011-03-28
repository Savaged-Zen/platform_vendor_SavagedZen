# Generic cyanogenmod product
PRODUCT_NAME := savagedzen
PRODUCT_BRAND := savagedzem
PRODUCT_DEVICE := generic

ifdef SAVAGEDZEN_NIGHTLY
PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=savagedzennightly
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=savagedzen
endif

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Used by BusyBox
KERNEL_MODULES_DIR:=/system/lib/modules

# Tiny toolbox
TINY_TOOLBOX:=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# CyanogenMod specific product packages
PRODUCT_PACKAGES += \
    FileManager \
    SZParts \
    SZWallpapers \
    Launcher2
    
    # Extra tools in SZMod
PRODUCT_PACKAGES += \
    openvpn

# Copy over the changelog to the device
PRODUCT_COPY_FILES += \
    vendor/savagedzen/CHANGELOG.mkdn:system/etc/CHANGELOG-SZ.txt
    vendor/savagedzen/CREDITS.mkdn:system/etc/CREDITS-SZ.txt

# Common SZ overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/savagedzen/overlay/common

PRODUCT_COPY_FILES += \
    vendor/savagedzen/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/savagedzen/prebuilt/common/bin/modelid_cfg.sh:system/bin/modelid_cfg.sh \
    vendor/savagedzen/prebuilt/common/bin/verify_cache_partition_size.sh:system/bin/verify_cache_partition_size.sh \
    vendor/savagedzen/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf \
    vendor/savagedzen/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/savagedzen/prebuilt/common/etc/terminfo/l/linux:system/etc/terminfo/l/linux \
    vendor/savagedzen/prebuilt/common/etc/terminfo/u/unknown:system/etc/terminfo/u/unknown \
    vendor/savagedzen/prebuilt/common/etc/profile:system/etc/profile \
    vendor/savagedzen/prebuilt/common/etc/init.local.rc:system/etc/init.local.rc \
    vendor/savagedzen/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/savagedzen/prebuilt/common/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    vendor/savagedzen/prebuilt/common/etc/init.d/03firstboot:system/etc/init.d/03firstboot \
    vendor/savagedzen/prebuilt/common/etc/init.d/04modules:system/etc/init.d/04modules \
    vendor/savagedzen/prebuilt/common/etc/init.d/05mountsd:system/etc/init.d/05mountsd \
    vendor/savagedzen/prebuilt/common/etc/init.d/06mountdl:system/etc/init.d/06mountdl \
    vendor/savagedzen/prebuilt/common/etc/init.d/20userinit:system/etc/init.d/20userinit \
    vendor/savagedzen/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache \
    vendor/savagedzen/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/savagedzen/prebuilt/common/bin/fix_permissions:system/bin/fix_permissions \
    vendor/savagedzen/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/savagedzen/prebuilt/common/xbin/htop:system/xbin/htop \
    vendor/savagedzen/prebuilt/common/xbin/irssi:system/xbin/irssi \
    vendor/savagedzen/prebuilt/common/xbin/powertop:system/xbin/powertop \
    vendor/savagedzen/prebuilt/common/xbin/openvpn-up.sh:system/xbin/openvpn-up.sh

PRODUCT_COPY_FILES += \
#    vendor/savagedzen/prebuilt/common/etc/init.d/10apps2sd:system/etc/init.d/10apps2sd

PRODUCT_COPY_FILES +=  \
    vendor/savagedzen/proprietary/RomManager.apk:system/app/RomManager.apk \

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Always run in insecure mode, enables root on user build variants
#ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0

ifdef SAVAGEDZEN_WITH_GOOGLE
    PRODUCT_COPY_FILES += \
        vendor/savagedzen/proprietary/CarHomeGoogle.apk:./system/app/CarHomeGoogle.apk \
        vendor/savagedzen/proprietary/CarHomeLauncher.apk:./system/app/CarHomeLauncher.apk \
        vendor/savagedzen/proprietary/Facebook.apk:./system/app/Facebook.apk \
        vendor/savagedzen/proprietary/GenieWidget.apk:./system/app/GenieWidget.apk \
        vendor/savagedzen/proprietary/Gmail.apk:./system/app/Gmail.apk \
        vendor/savagedzen/proprietary/GoogleBackupTransport.apk:./system/app/GoogleBackupTransport.apk \
        vendor/savagedzen/proprietary/GoogleCalendarSyncAdapter.apk:./system/app/GoogleCalendarSyncAdapter.apk \
        vendor/savagedzen/proprietary/GoogleContactsSyncAdapter.apk:./system/app/GoogleContactsSyncAdapter.apk \
        vendor/savagedzen/proprietary/GoogleFeedback.apk:./system/app/GoogleFeedback.apk \
        vendor/savagedzen/proprietary/GooglePartnerSetup.apk:./system/app/GooglePartnerSetup.apk \
        vendor/savagedzen/proprietary/GoogleQuickSearchBox.apk:./system/app/GoogleQuickSearchBox.apk \
        vendor/cyanogen/proprietary/GoogleServicesFramework.apk:./system/app/GoogleServicesFramework.apk \
        vendor/savagedzen/proprietary/HtcCopyright.apk:./system/app/HtcCopyright.apk \
        vendor/savagedzen/proprietary/HtcEmailPolicy.apk:./system/app/HtcEmailPolicy.apk \
        vendor/savagedzen/proprietary/HtcSettings.apk:./system/app/HtcSettings.apk \
        vendor/savagedzen/proprietary/LatinImeTutorial.apk:./system/app/LatinImeTutorial.apk \
        vendor/savagedzen/proprietary/Maps.apk:./system/app/Maps.apk \
        vendor/savagedzen/proprietary/MarketUpdater.apk:./system/app/MarketUpdater.apk \
        vendor/savagedzen/proprietary/MediaUploader.apk:./system/app/MediaUploader.apk \
        vendor/savagedzen/proprietary/NetworkLocation.apk:./system/app/NetworkLocation.apk \
        vendor/savagedzen/proprietary/OneTimeInitializer.apk:./system/app/OneTimeInitializer.apk \
        vendor/savagedzen/proprietary/PassionQuickOffice.apk:./system/app/PassionQuickOffice.apk \
        vendor/savagedzen/proprietary/SetupWizard.apk:./system/app/SetupWizard.apk \
        vendor/savagedzen/proprietary/Street.apk:./system/app/Street.apk \
        vendor/savagedzen/proprietary/Talk.apk:./system/app/Talk.apk \
        vendor/savagedzen/proprietary/Twitter.apk:./system/app/Twitter.apk \
        vendor/savagedzen/proprietary/Vending.apk:./system/app/Vending.apk \
        vendor/savagedzen/proprietary/VoiceSearch.apk:./system/app/VoiceSearch.apk \
        vendor/savagedzen/proprietary/YouTube.apk:./system/app/YouTube.apk \
        vendor/savagedzen/proprietary/googlevoice.apk:./system/app/googlevoice.apk \
        vendor/savagedzen/proprietary/kickback.apk:./system/app/kickback.apk \
        vendor/savagedzen/proprietary/soundback.apk:./system/app/soundback.apk \
        vendor/savagedzen/proprietary/talkback.apk:./system/app/talkback.apk \
        vendor/savagedzen/proprietary/com.google.android.maps.xml:./system/etc/permissions/com.google.android.maps.xml \
        vendor/savagedzen/proprietary/features.xml:./system/etc/permissions/features.xml \
        vendor/savagedzen/proprietary/com.google.android.maps.jar:./system/framework/com.google.android.maps.jar \
        vendor/savagedzen/proprietary/libspeech.so:./system/lib/libspeech.so
else
    PRODUCT_PACKAGES += \
        Provision \
        GoogleSearch \
        LatinIME
endif
