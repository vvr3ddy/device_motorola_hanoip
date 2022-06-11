# Inherit from common AOSP config
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

LOCAL_PATH := device/motorola/hanoip


# define hardware platform
PRODUCT_PLATFORM := sm6150
# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/motorola/hanoip/hanoip-vendor.mk)


# The first api level, device has been commercially launched on.
PRODUCT_SHIPPING_API_LEVEL := 30

PRODUCT_TARGET_VNDK_VERSION := 30

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

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
    
# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    libaacwrapper

# Bluetooth
PRODUCT_PACKAGES += \
    BluetoothQti

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

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

# fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

# FM
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# Init
PRODUCT_PACKAGES += \
    init.qcom.rc

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.hanoip

#Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# rro_overlays
PRODUCT_PACKAGES += \
    WifiOverlay

# Perf
PRODUCT_PACKAGES += \
    vendor.qti.hardware.perf@2.0

# Properties
-include $(LOCAL_PATH)/product_prop.mk
-include $(LOCAL_PATH)/system_prop.mk
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# VINTF
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/vintf/android.hardware.lights-qti.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/vintf/manifest/android.hardware.lights-qti.xml
