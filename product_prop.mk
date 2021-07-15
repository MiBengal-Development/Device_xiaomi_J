# Audio
PRODUCT_PRODUCT_PROPERTIES += \
    ro.bluetooth.a2dp_offload.supported=false \
    persist.bluetooth.a2dp_offload.disabled=true \
    persist.bluetooth.bluetooth_audio_hal.disabled=true \
    vendor.audio.feature.a2dp_offload.enable=false \
    persist.vendor.qcom.bluetooth.enable.splita2dp=false

# Bluetooth
PRODUCT_PRODUCT_PROPERTIES += \
    ro.bluetooth.library_name=libbluetooth.so 

# Graphics
PRODUCT_PRODUCT_PROPERTIES += \
    debug.hwui.renderer=skiavk \
    debug.sf.hw=1 \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
    ro.surface_flinger.running_without_sync_framework=true \
    ro.surface_flinger.use_context_priority=true \
    ro.config.avoid_gfx_accel=true \
    debug.sf.latch_unsignaled=0

# Blurs
PRODUCT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.supports_background_blur=0 \
    persist.sys.sf.disable_blurs=1 \
    ro.sf.blurs_are_expensive=0

# Power-saving props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.use_data_netmgrd=true \
    ro.vold.umsdirtyratio=20 \
    ro.ril.disable.power.collapse=0 \
    power.saving.mode=1 \
    pm.sleep_mode=1

# DRM
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

#Gboard Configuration by Vern
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.ime.corner_key_l=32 \
    ro.com.google.ime.corner_key_r=32 \
    ro.com.google.ime.themed_nav_bar_style=2 \
    ro.com.google.ime.silk_theme=true \
    ro.com.google.ime.pill_shaped_key=true \
    ro.com.google.ime.enable_keyboard_redesign=true \
    ro.com.google.ime.use_keyboard_redesign_theme_by_default=true \
    ro.com.google.ime.kb_pad_port_r=8.0 \
    ro.com.google.ime.kb_pad_port_l=8.0 \
    ro.com.google.ime.kb_pad_land_r=96.0 \
    ro.com.google.ime.kb_pad_land_l=96.0
