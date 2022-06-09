#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from hanoip device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

PRODUCT_BRAND := motorola
PRODUCT_DEVICE := hanoip
PRODUCT_MANUFACTURER := motorola
PRODUCT_NAME := lineage_hanoip
PRODUCT_MODEL := moto g(60)

PRODUCT_GMS_CLIENTID_BASE := android-motorola
TARGET_VENDOR := motorola
TARGET_VENDOR_PRODUCT_NAME := hanoip
PRODUCT_BUILD_PROP_OVERRIDES += PRIVATE_BUILD_DESC="hanoip_retail-user 11 RRIS31.Q1-42-51-12-1 01c61 release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := motorola/hanoip_retail/hanoip:11/RRIS31.Q1-42-51-12-1/01c61:user/release-keys
