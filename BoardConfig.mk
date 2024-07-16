#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm6150-common
include device/motorola/sm6150-common/BoardConfigCommon.mk

DEVICE_PATH := device/motorola/hanoip

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := hanoip

# Display
TARGET_SCREEN_DENSITY := 420

# Kernel
TARGET_KERNEL_CONFIG += vendor/ext_config/hanoip-default.config

