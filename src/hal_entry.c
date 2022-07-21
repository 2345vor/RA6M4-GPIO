/*
 * Copyright (c) 2006-2021, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author        Notes
 * 2021-10-10     Sherman       first version
 * 2021-11-03     Sherman       Add icu_sample
 */

#include <rtthread.h>
#include "hal_data.h"
#include <rtdevice.h>

#define LED3_PIN    BSP_IO_PORT_01_PIN_06
#define USER_INPUT  BSP_IO_PORT_01_PIN_05

void hal_entry(void)
{
    rt_kprintf("\nHello RT-Thread!\n");

    while (1)
    {
        if (rt_pin_read(USER_INPUT)==0) {
            rt_pin_write(LED3_PIN, PIN_HIGH);
            rt_thread_mdelay(500);
            rt_pin_write(LED3_PIN, PIN_LOW);
            rt_thread_mdelay(500);
        } else {
            rt_pin_write(LED3_PIN, PIN_HIGH);
            rt_thread_mdelay(2000);
            rt_pin_write(LED3_PIN, PIN_LOW);
            rt_thread_mdelay(500);
        }
        rt_kprintf("USER_INPUT=%d !\n",rt_pin_read(USER_INPUT));
        rt_thread_mdelay(1);
    }
}


