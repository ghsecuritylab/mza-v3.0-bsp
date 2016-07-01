#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


PRODUCT_COPY_FILES := \
	device/ti/beagleboard/init.omap3beagleboard.rc:root/init.omap3beagleboard.rc \
	device/ti/beagleboard/vold.fstab:system/etc/vold.fstab \
	device/ti/beagleboard/media_codecs.xml:system/etc/media_codecs.xml \
	device/ti/omap3evm/audio_policy.conf:system/etc/audio_policy.conf \
	device/ti/beagleboard/mixer_paths.xml:system/etc/mixer_paths.xml \
	addition_bkav/touchButton/touchButton:system/bin/touchButton \
	addition_bkav/touchButton/touchButton.sh:system/bin/touchButton.sh \
	addition_bkav/tinymix_config/tinymix_config:system/bin/tinymix_config \
	addition_bkav/adb_tcpIP/adb_tcpIP:system/bin/adb_tcpIP \
	hardware/ti/wlan/mac80211/ti-utils/ini_files/127x/TQS_S_2.6.ini:system/etc/wifi/ini_files/127x/TQS_S_2.6.ini \
	addition_bkav/wifi_calibrator/wifi_calibrator:system/bin/wifi_calibrator


# Enable WiFi option
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml

# Enable Bluetooth option
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf

PRODUCT_PROPERTY_OVERRIDES := \
	hwui.render_dirty_regions=false \
	ro.sf.lcd_density=170

PRODUCT_CHARACTERISTICS := tablet, nosdcard

DEVICE_PACKAGE_OVERLAYS := \
    device/ti/beagleboard/overlay

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

PRODUCT_PACKAGES += \
	libaudioutils

PRODUCT_PACKAGES += \
        audio.primary.beagleboard \
        tinycap \
        tinymix \
        tinyplay

SUPERUSER_EMBEDDED := true

# Wi-Fi
PRODUCT_PACKAGES += \
	dhcpcd.conf \
	hostapd.conf \
	TQS_D_1.7.ini \
	TQS_S_2.6_127x_wg7310.ini \
	wifical.sh \
	crda \
	regulatory.bin \
	calibrator

# Wifi Direct Application
PRODUCT_PACKAGES += \
        WiFi_Direct

PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs

PRODUCT_PACKAGES += \
	camera.omap3

# FileManager Application
PRODUCT_PACKAGES += \
        FileManager-1.1.6

# BlueZ test tools
PRODUCT_PACKAGES += \
	hciconfig \
	hcitool

# Bluetooth A2DP audio support
PRODUCT_PACKAGES += \
	audio.a2dp.default

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
$(call inherit-product-if-exists, hardware/ti/wpan/wl12xx-bluetooth/wl12xx_bt_products.mk)
$(call inherit-product-if-exists, hardware/ti/wlan/mac80211/firmware/wl12xx_wlan_fw_products.mk)