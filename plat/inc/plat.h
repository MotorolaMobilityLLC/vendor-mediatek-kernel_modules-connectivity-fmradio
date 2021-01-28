/*
 * Copyright (C) 2019 MediaTek Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See http://www.gnu.org/licenses/gpl-2.0.html for more details.
 */

#ifndef FM_PLAT_H
#define FM_PLAT_H

#include <linux/mm.h>
#include <linux/platform_device.h>
#include <linux/ioport.h>
#include <linux/interrupt.h>
#include <linux/of_irq.h>
#include <linux/of_address.h>
#include <linux/of.h>

#include "fm_typedef.h"
#include "fm_dbg.h"
#include "fm_err.h"
#include "fm_stdlib.h"
#include "fm_link.h"
#include "fm_utils.h"
#include "fm_rds.h"
#include "fm_ext_api.h"
#include "fm_reg_utils.h"

#if CFG_FM_CONNAC2
#include "conninfra.h"
#else
#include "osal_typedef.h"
#include "stp_exp.h"
#include "wmt_exp.h"
#endif

extern signed int fm_rds_parser(
	struct rds_rx_t *rds_raw, signed int rds_size);

#endif /* FM_PLAT_H */
