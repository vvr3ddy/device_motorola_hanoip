##
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/hanoip

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a9

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := hanoip
TARGET_NO_BOOTLOADER := true


# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := sm6150

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/system_ext.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Display
TARGET_SCREEN_DENSITY := 420

# HIDL
ODM_MANIFEST_SKUS += b d dn n
ODM_MANIFEST_B_FILES := $(DEVICE_PATH)/sku/manifest_b.xml
ODM_MANIFEST_D_FILES := $(DEVICE_PATH)/sku/manifest_d.xml
ODM_MANIFEST_DN_FILES := $(DEVICE_PATH)/sku/manifest_dn.xml
ODM_MANIFEST_N_FILES := $(DEVICE_PATH)/sku/manifest_n.xml

# Filesystem
TARGET_FS_CONFIG_GEN := \
    $(DEVICE_PATH)/config.fs \
    $(DEVICE_PATH)/mot_aids.fs

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/framework_compatibility_matrix.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml

# Kernel
BOARD_BOOT_HEADER_VERSION := 3
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 earlycon=msm_geni_serial,0x4a90000 androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=2048 loop.max_part=7
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
TARGET_KERNEL_CONFIG := hanoip_defconfig
TARGET_KERNEL_SOURCE := kernel/motorola/sm6150

# Kernel - Prebuilt
include device/motorola/sm6150-kernel/prebuilt_kernel.mk

# Kernel Modules - Vendor Boot
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/vendor_boot.modules.load))
BOOT_KERNEL_MODULES := $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD)

BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_adsp_loader.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_apr.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_bolero_cdc.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_hdmi.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_machine_talos.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_mbhc.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_native.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_pinctrl_lpi.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_pinctrl_wcd.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_platform.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_q6.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_q6_notifier.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_q6_pdr.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_rx_macro.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_snd_event.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_stub.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_swr_ctrl.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_swr.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_tx_macro.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_usf.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_va_macro.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_wcd934x.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_wcd937x.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_wcd937x_slave.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_wcd9xxx.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_wcd_core.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_wcd_spi.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_wglink.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_wsa881x.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/audio_wsa_macro.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/exfat.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/fpc1020_mmi.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/fpsensor_spi_tee.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/ilitek_v3_mmi.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/mmi_annotate.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/mmi_info.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/mmi_sys_temp.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/moto_f_usbnet.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/mpq-adapter.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/mpq-dmx-hw-plugin.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/qca_cld3_wlan.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/qpnp_adaptive_charge.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/rdbg.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/sensors_class.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/snd_smartpa_aw882xx.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/sx933x_sar.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/tzlog_dump.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/utags.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/watchdog_cpu_ctx.ko
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += device/motorola/sm6150-kernel/hanoip/modules/vendor_ramdisk/watchdogtest.ko

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_USES_METADATA_PARTITION := true

BOARD_BOOTIMAGE_PARTITION_SIZE := 98304000
BOARD_DTBOIMG_PARTITION_SIZE := 24576000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 52983788000
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 98304000

BOARD_SUPER_PARTITION_SIZE := 7405568000
BOARD_SUPER_PARTITION_GROUPS := moto_dynamic_partitions
BOARD_MOTO_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor
BOARD_MOTO_DYNAMIC_PARTITIONS_SIZE := 7401568000 # BOARD_SUPER_PARTITION_SIZE - 4MB

BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom_ufs
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 100
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# Sepolicy
include device/qcom/sepolicy_vndr/SEPolicy.mk

# Security patch level
VENDOR_SECURITY_PATCH := 2021-08-01

# Inherit from the proprietary version
include vendor/motorola/hanoip/BoardConfigVendor.mk

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_VBMETA_SYSTEM := system system_ext product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1
