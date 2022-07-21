@[toc](【Renesas RA6M4开发板之按键和LED的GPIO】)

# 1.0 I/O 设备模型
绝大部分的嵌入式系统都包括一些 I/O（Input/Output，输入 / 输出）设备，例如仪器上的数据显示屏、工业设备上的串口通信、数据采集设备上用于保存数据的 Flash 或 SD 卡，以及网络设备的以太网接口等，都是嵌入式系统中容易找到的 I/O 设备例子。

## 1.1 I/O 设备模型框架
RT-Thread 提供了一套简单的 I/O 设备模型框架，如下图所示，它位于硬件和应用程序之间，共分成三层，从上到下分别是 I/O 设备管理层、设备驱动框架层、设备驱动层。
![在这里插入图片描述](https://img-blog.csdnimg.cn/af9c471f03344ab3a31badff192e9754.png)
应用程序通过 I/O 设备管理接口获得正确的设备驱动，然后通过这个设备驱动与底层 I/O 硬件设备进行数据（或控制）交互。

## 1.2 I/O 设备模型
RT-Thread 的设备模型是建立在内核对象模型基础之上的，设备被认为是一类对象，被纳入对象管理器的范畴。每个设备对象都是由基对象派生而来，每个具体设备都可以继承其父类对象的属性，并派生出其私有属性，下图是设备对象的继承和派生关系示意图。
![在这里插入图片描述](https://img-blog.csdnimg.cn/e35c0fa661704e639f8a8a580e16ca77.png)


# 2. RT-theard配置
## 2.1 硬件需求


> 实现功能：
> 板载按键切换LED3 不同频闪模式。

1、RA6M4开发板
![在这里插入图片描述](https://img-blog.csdnimg.cn/4c5dcda23c6d4afaacb393dc46a7ae51.png)
2、USB下载线，ch340串口和附带2根母母线，**rx---p613;tx---p614**
![在这里插入图片描述](https://img-blog.csdnimg.cn/00c41a688cfb4fc096324fbbe1d3feb9.png)
*实验中采用按键和LED3都板载的（分别对应p105和p106）*


## 2.2 软件配置
Renesas RA6M4开发板环境配置参照：[【基于 RT-Thread Studio的CPK-RA6M4 开发板环境搭建】](https://blog.csdn.net/vor234/article/details/125634313)
1、新建项目RA6M4-GPIO工程
![在这里插入图片描述](https://img-blog.csdnimg.cn/1e3de91d9b624c0887c254a8e60938e5.png)

2、修改src文件下的main.c文件，其他不变。
`main.c`
```cpp
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



```

**保存完是灰色，没有保存是蓝色。**
# 3. 代码分析
采用轮询方式检查按键是否触发，好像按键默认拉高了


# 4. 下载验证
1、编译重构
![在这里插入图片描述](https://img-blog.csdnimg.cn/ba3a8424fe3a4a9f845a7a3dd5375d00.png)

编译成功

2、下载程序
![在这里插入图片描述](https://img-blog.csdnimg.cn/880e09ffbf924bb087aa4e5c51b51e80.png)

下载成功


3、CMD串口调试

![在这里插入图片描述](https://img-blog.csdnimg.cn/181227ee2ed64ef2801477ece50cf41c.png)
然后板载复位
![在这里插入图片描述](https://img-blog.csdnimg.cn/1421d3b65a60412496f68b33a4123033.png)

效果如下
![请添加图片描述](https://img-blog.csdnimg.cn/2f9e3b7841b0497d8b0663f68ff7a534.gif)

这样我们就可以天马行空啦!![请添加图片描述](https://img-blog.csdnimg.cn/92099d4d054b4b2cbd39b95719739a90.gif)

参考文献；
[【基于 RT-Thread Studio的CPK-RA6M4 开发板环境搭建】](https://blog.csdn.net/vor234/article/details/125634313)
