# Copyright (C) 2025-2026 OrangeFox Recovery Project
# Copyright (C) 2026 chickendrop89
# SPDX-License-Identifier: GPL-3.0-only

# OrangeFox maintainer
OF_MAINTAINER := IQ_HARRY_07

# Screen settings
OF_SCREEN_H := 2400
OF_STATUS_H := 100
OF_STATUS_INDENT_LEFT := 48
OF_STATUS_INDENT_RIGHT := 48
OF_ALLOW_DISABLE_NAVBAR := 0
OF_CLOCK_POS := 1
OF_OPTIONS_LIST_NUM := 9

# Quick backup (Boot, sensor data)
OF_QUICK_BACKUP_LIST := /boot;/persist_image;

# Flashlight & LEDs
OF_FL_PATH1	:= /tmp/of_torch
OF_USE_GREEN_LED := 0

# Security (Disables MTP & ADB during password prompt)
OF_ADVANCED_SECURITY := 0
# Good for Debugging. change later at release.

# HOS & Custom ROMs
OF_NO_TREBLE_COMPATIBILITY_CHECK := 1

# A/B partitioning
OF_AB_DEVICE_WITH_RECOVERY_PARTITION := 1
OF_ENABLE_ALL_PARTITION_TOOLS := 1

# Fix recovery issues caused by large splash images
OF_SPLASH_MAX_SIZE = 2048

# Ignore the loop block errors after flashing ZIPs
OF_LOOP_DEVICE_ERRORS_TO_LOG := 1

# Use legacy code to fix clock issues
OF_USE_LEGACY_TIME_FIXUP := 1

# Wipe /metadata after /data format
OF_WIPE_METADATA_AFTER_DATAFORMAT := 1

# Ensure that /sdcard is unbinded before /data repair/format
OF_UNBIND_SDCARD_F2FS := 1

# Force "F2FS" when formatting /data
OF_FORCE_DATA_FORMAT_F2FS := 1

# Force casefolding to avoid /data issues
OF_FORCE_CASEFOLDING := 1

# Enable the FRP reset addon
OF_ENABLE_FRP_ADDON := 1

# LZ4
OF_USE_LZ4_COMPRESSION := 1

# dmctl
OF_USE_DMCTL := 1
#
