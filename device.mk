#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Inherit from vendor if exists
$(call inherit-product-if-exists, vendor/xiaomi/juice/juice-vendor.mk)

# Inherit QTI Bluetooth
$(call inherit-product, vendor/qcom/opensource/commonsys-intf/bluetooth/bt-system-opensource-product.mk)

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 29

# Target VNDK
PRODUCT_TARGET_VNDK_VERSION := 30

# Partition
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true
BOARD_BUILD_PRODUCT_IMAGE := true

# Soong Namespace
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Add default implementation of fastboot HAL.
PRODUCT_PACKAGES += android.hardware.fastboot@1.0-impl-mock

# ANT+
PRODUCT_PACKAGES += \
    AntHalService-Soong \
    com.dsi.ant.antradio_library \
    com.dsi.ant@1.0

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@6.0-impl \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.audio.service \
    vendor.qti.hardware.audiohalext@1.0 \
    vendor.qti.hardware.audiohalext-utils

PRODUCT_PACKAGES += \
    audio.a2dp.default

PRODUCT_PACKAGES += \
    tinymix \
    libaudio-resampler

# Bluetooth
PRODUCT_PACKAGES += \
    vendor.qti.hardware.bluetooth_audio@2.0.vendor \
    vendor.qti.hardware.btconfigstore@1.0.vendor

# Google Camera
PRODUCT_PACKAGES += \
    GoogleCameraGo
    
# Display
PRODUCT_PACKAGES += \
    libdisplayconfig \
    libqdMetaData \
    libqdMetaData.system

# Vulkan
PRODUCT_PACKAGES += \
    libvulkan

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Sensors
PRODUCT_PACKAGES += \
    libsensorndkbridge \

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

# Fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.default:$(TARGET_COPY_OUT_RAMDISK)/fstab.default

# Ramdisk
PRODUCT_PACKAGES += \
    getwlansar.sh \
    init.class_main.sh \
    init.crda.sh \
    init.mdm.sh \
    init.mi.usb.sh \
    init.qcom.class_core.sh \
    init.qcom.coex.sh \
    init.qcom.early_boot.sh \
    init.qcom.efs.sync.sh \
    init.qcom.post_boot.sh \
    init.qcom.sdio.sh \
    init.qcom.sensors.sh \
    init.qcom.sh \
    init.qcom.usb.sh \
    init.qti.chg_policy.sh \
    init.qti.dcvs.sh \
    init.qti.qcv.sh \
    install-recovery.sh \
    qca6234-service.sh \
    setwlansarhigh.sh \
    setwlansarlow.sh \
    init.qcom.factory.rc \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.qti.ufs.rc \
    init.stnfc.rc \
    init.target.rc \
    fstab.default \
    fstab.emmc \
    ueventd.qcom.rc

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-goodix.kl \
    $(LOCAL_PATH)/keylayout/uinput-focal.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-focal.kl \
    $(LOCAL_PATH)/keylayout/uinput-cdfinger.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-cdfinger.kl

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_configs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_configs.xml \
    $(LOCAL_PATH)/configs/audio/audio_configs_stock.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_configs_stock.xml \
    $(LOCAL_PATH)/configs/audio/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/configs/audio/audio_io_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_io_policy.conf \
    $(LOCAL_PATH)/configs/audio/audio_log.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/audio_log.cfg \
    $(LOCAL_PATH)/configs/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/audio_platform_info_idp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_idp.xml \
    $(LOCAL_PATH)/configs/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(LOCAL_PATH)/configs/audio/audio_platform_info_scubaidp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_scubaidp.xml \
    $(LOCAL_PATH)/configs/audio/audio_platform_info_scubaqrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_scubaqrd.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/configs/audio/bluetooth_qti_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_qti_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_idp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_idp.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_scubaidp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_scubaidp.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_scubaqrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_scubaqrd.xml \
    $(LOCAL_PATH)/configs/audio/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_mixer_paths_idp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_idp.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_mixer_paths_scubaidp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_scubaidp.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_mixer_paths_scubaqrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_scubaqrd.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# Exclude sensor from InputManager
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/excluded-input-devices.xml:system/etc/excluded-input-devices.xml

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/apdr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/apdr.conf \
    $(LOCAL_PATH)/configs/gps/flp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/flp.conf \
    $(LOCAL_PATH)/configs/gps/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps/izat.conf:$(TARGET_COPY_OUT_VENDOR)/etc/izat.conf \
    $(LOCAL_PATH)/configs/gps/lowi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/lowi.conf \
    $(LOCAL_PATH)/configs/gps/sap.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sap.conf \
    $(LOCAL_PATH)/configs/gps/xtwifi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/xtwifi.conf

# IRQ
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# IRSC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-goodix.kl

# Low power Whitelist
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/qti_whitelist.xml:system/etc/sysconfig/qti_whitelist.xml

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_v1.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance_v2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_v2.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_vendor_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_audio.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_vendor_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_v1.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_vendor_v2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_v2.xml \
    $(LOCAL_PATH)/configs/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_scuba.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_scuba.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml \
    $(LOCAL_PATH)/configs/media/system_properties.xml:$(TARGET_COPY_OUT_VENDOR)/etc/system_properties.xml

# Public Libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# QTI
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/privapp-permissions-qti.xml

# Seccomp
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/seccomp/atfwd@2.0.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/atfwd@2.0.policy \
    $(LOCAL_PATH)/configs/seccomp/configstore@1.1.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/configstore@1.1.policy \
    $(LOCAL_PATH)/configs/seccomp/imsrtp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/imsrtp.policy \
    $(LOCAL_PATH)/configs/seccomp/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(LOCAL_PATH)/configs/seccomp/qspm.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/qspm.policy \
    $(LOCAL_PATH)/configs/seccomp/qti-systemd.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/qti-systemd.policy \
    $(LOCAL_PATH)/configs/seccomp/vendor.qti.hardware.dsp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/vendor.qti.hardware.dsp.policy \
    $(LOCAL_PATH)/configs/seccomp/wfdhdcphalservice.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/wfdhdcphalservice.policy \
    $(LOCAL_PATH)/configs/seccomp/wfdvndservice.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/wfdvndservice.policy \
    $(LOCAL_PATH)/configs/seccomp/wifidisplayhalservice.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/wifidisplayhalservice.policy

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/configs/wifi/aoa_cldb_falcon.bin:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/aoa_cldb_falcon.bin \
    $(LOCAL_PATH)/configs/wifi/aoa_cldb_swl14.bin:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/aoa_cldb_swl14.bin \
    $(LOCAL_PATH)/configs/wifi/fstman.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/fstman.ini \
    $(LOCAL_PATH)/configs/wifi/icm.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/icm.conf \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/sar-vendor-cmd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/sar-vendor-cmd.xml \
    $(LOCAL_PATH)/configs/wifi/wigig_p2p_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wigig_p2p_supplicant.conf \
    $(LOCAL_PATH)/configs/wifi/wigig_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wigig_supplicant.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service-qti

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Remove unwanted packages
PRODUCT_PACKAGES += \
    RemovePackages

#PRODUCT_PACKAGES += \
#    AospFrameworkResOverlay \
#    AospWifiResOverlay \
#    GmsTelecommOverlay \
#    GmsTelephonyOverlay \
#    CarrierConfigResCommon \
#   CellBroadcastReceiverResCommon \
#    FrameworksResCommon \
#    FrameworksResTarget \
#    SystemUIResCommon \
#    TelecommResCommon \
#    TelephonyResCommon \
#    WifiResCommon

