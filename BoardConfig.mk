#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/hanoip

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := hanoip

# Display
TARGET_SCREEN_DENSITY := 420

# Kernel
TARGET_KERNEL_CONFIG += vendor/ext_config/hanoip-default.config

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 100

# Security patch level
VENDOR_SECURITY_PATCH := 2021-08-01

