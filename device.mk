# Inherit from common AOSP config
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

LOCAL_PATH := device/motorola/hanoip

# define hardware platform
PRODUCT_PLATFORM := sm6150

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 30

# Dynamic partitions setup
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Enable virtual A/B OTA
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Prebuilt headers
PRODUCT_VENDOR_KERNEL_HEADERS := $(LOCAL_PATH)/kernel-headers

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    product \
    system \
    system_ext \
    vendor \
    vendor_boot \
    vbmeta \
    vbmeta_system

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti \
    android.hardware.boot@1.1-impl-qti.recovery \
    android.hardware.boot@1.1-service

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

#TWRP
PRODUCT_COPY_FILES += \
    device/motorola/hanoip/prebuilt/systemmanifest.xml:$(TARGET_COPY_OUT_RECOVERY)/root/system/manifest.xml \
    device/motorola/hanoip/prebuilt/vendormanifest.xml:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/manifest.xml

# qcom decryption
PRODUCT_PACKAGES_ENG += \
    qcom_decrypt \
    qcom_decrypt_fbe

# tzdata
PRODUCT_PACKAGES_ENG += \
    tzdata_twrp

# Apex libraries
PRODUCT_COPY_FILES += \
    device/motorola/hanoip/recovery/root/system/lib64/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libandroidicu.so \
    device/motorola/hanoip/recovery/root/system/lib64/libhidlbase.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libhidlbase.so

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0
# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.hanoip.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/init.hanoip.rc

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.hanoip

# VINTF
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/vintf/android.hardware.lights-qti.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/vintf/manifest/android.hardware.lights-qti.xml

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    Tag \
    SecureElement \
    com.android.nfc_extras

# Device Settings
PRODUCT_PACKAGES += \
    DeviceSettings

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.ims.xml

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext \

PRODUCT_BOOT_JARS += \
    telephony-ext

# FM
PRODUCT_PACKAGES += \
    FM2 \
    qcom.fmradio

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service.hanoip-libperfmgr

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/power-libperfmgr/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# WiFi Display
PRODUCT_PACKAGES += \
    libavservices_minijail \
    libdisplayconfig.qti \
    libminijail \
    libnl \
    libqdMetaData \
    libwfdaac_vendor \
    vendor.display.config@2.0

PRODUCT_BOOT_JARS += \
    WfdCommon

include vendor/motorola/hanoip/hanoip-vendor.mk

