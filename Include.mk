LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
$(info FM_LAYERDEC_2 = $(FM_LAYERDEC_2))
$(info FM_PLAT = $(FM_PLAT))
$(info FM_CHIP = $(FM_CHIP))
$(info FM_CHIP_ID = $(FM_CHIP_ID))
$(info BUILD_CONNAC2 = $(BUILD_CONNAC2))

ifeq ($(FM_LAYERDEC_2),)
    LOCAL_INIT_RC := init.fmradio_drv_ld1.rc
    MODULE_NAME := fmradio_drv
else
    MODULE_NAME := fmradio_drv_$(FM_PLAT)
    LOCAL_INIT_RC := init.fmradio_drv_ld2.rc
endif
LOCAL_MODULE := $(MODULE_NAME).ko
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_OWNER := mtk
ifeq ($(BUILD_CONNAC2), true)
    LOCAL_REQUIRED_MODULES := conninfra.ko
else
    LOCAL_REQUIRED_MODULES := wmt_drv.ko
endif

ifeq ($(TARGET_BUILD_VARIANT),user)
    FM_OPTS := CONFIG_FM_USER_LOAD=1
else
    FM_OPTS :=
endif

ifeq ($(FM_LAYERDEC_2),)
    FM_OPTS += MODULE_NAME=$(MODULE_NAME) CFG_BUILD_CONNAC2=$(BUILD_CONNAC2) CFG_FM_CHIP_ID=$(FM_CHIP_ID) CFG_FM_CHIP=$(FM_CHIP)
else
    FM_OPTS += MODULE_NAME=$(MODULE_NAME) CFG_BUILD_CONNAC2=$(BUILD_CONNAC2) CFG_FM_CHIP=$(FM_CHIP) CFG_FM_LAYERDEC_2=$(FM_LAYERDEC_2)
endif

include $(MTK_KERNEL_MODULE)

$(linked_module): OPTS += $(FM_OPTS)

