package com.itlab.blog.model.monitor;

import com.itlab.blog.utils.Arith;
import com.itlab.blog.utils.IPUtils;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import oshi.SystemInfo;
import oshi.hardware.CentralProcessor;
import oshi.hardware.GlobalMemory;
import oshi.hardware.HardwareAbstractionLayer;
import oshi.software.os.FileSystem;
import oshi.software.os.OSFileStore;
import oshi.software.os.OperatingSystem;
import oshi.util.Util;

import java.net.UnknownHostException;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;

/**
 * @program: blog
 * @description:
 * @author: radCircle
 * @create: 2021-08-05 12:27
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Server {

    private static final int OSHI_WAIT_SECOND = 1000;

    /**
     * CPU相关信息
     */
    private Cpu cpu = new Cpu();

    /**
     * 內存相关信息
     */
    private Mem mem = new Mem();

    /**
     * JVM相关信息
     */
    private Jvm jvm = new Jvm();

    /**
     * 服务器相关信息
     */
    private Sys sys = new Sys();

    /**
     * 磁盘相关信息
     */
    private List<SysFile> sysFiles = new LinkedList<SysFile>();
    /**
     * 服务器环境信息
     */
    private ServerInfo serverInfo = new ServerInfo();


    public void copyTo() throws Exception {
        SystemInfo si = new SystemInfo();
        HardwareAbstractionLayer hal = si.getHardware();
        setCpuInfo(hal.getProcessor());
        setMemInfo(hal.getMemory());
        setSysInfo();
        setJvmInfo();
        setSysFiles(si.getOperatingSystem());
        setServerInfo();
    }

    /**
     * 设置CPU信息
     */
    private void setCpuInfo(CentralProcessor processor) {
        // CPU信息
        long[] prevTicks = processor.getSystemCpuLoadTicks();
        Util.sleep(OSHI_WAIT_SECOND);
        long[] ticks = processor.getSystemCpuLoadTicks();
        long nice =
                ticks[CentralProcessor.TickType.NICE.getIndex()] - prevTicks[CentralProcessor.TickType.NICE.getIndex()];
        long irq =
                ticks[CentralProcessor.TickType.IRQ.getIndex()] - prevTicks[CentralProcessor.TickType.IRQ.getIndex()];
        long softirq =
                ticks[CentralProcessor.TickType.SOFTIRQ.getIndex()] - prevTicks[CentralProcessor.TickType.SOFTIRQ.getIndex()];
        long steal =
                ticks[CentralProcessor.TickType.STEAL.getIndex()] - prevTicks[CentralProcessor.TickType.STEAL.getIndex()];
        long cSys =
                ticks[CentralProcessor.TickType.SYSTEM.getIndex()] - prevTicks[CentralProcessor.TickType.SYSTEM.getIndex()];
        long user =
                ticks[CentralProcessor.TickType.USER.getIndex()] - prevTicks[CentralProcessor.TickType.USER.getIndex()];
        long iowait =
                ticks[CentralProcessor.TickType.IOWAIT.getIndex()] - prevTicks[CentralProcessor.TickType.IOWAIT.getIndex()];
        long idle =
                ticks[CentralProcessor.TickType.IDLE.getIndex()] - prevTicks[CentralProcessor.TickType.IDLE.getIndex()];
        long totalCpu = user + nice + cSys + idle + iowait + irq + softirq + steal;
        cpu.setCpuNum(processor.getLogicalProcessorCount());
        cpu.setTotal(totalCpu);
        cpu.setSys(cSys);
        cpu.setUsed(user);
        cpu.setWait(iowait);
        cpu.setFree(idle);
    }

    /**
     * 设置内存信息
     */
    private void setMemInfo(GlobalMemory memory) {
        mem.setTotal(memory.getTotal());
        mem.setUsed(memory.getTotal() - memory.getAvailable());
        mem.setFree(memory.getAvailable());
    }

    /**
     * 设置服务器信息
     */
    private void setSysInfo() throws UnknownHostException {
        Properties props = System.getProperties();
        sys.setComputerName(IPUtils.getHostName());
        sys.setComputerIp(IPUtils.getHostIP());
        sys.setOsName(props.getProperty("os.name"));
        sys.setOsArch(props.getProperty("os.arch"));
        sys.setUserDir(props.getProperty("user.dir"));
    }

    /**
     * 设置Java虚拟机
     */
    private void setJvmInfo() throws UnknownHostException {
        Properties props = System.getProperties();
        jvm.setTotal(Runtime.getRuntime().totalMemory());
        jvm.setMax(Runtime.getRuntime().maxMemory());
        jvm.setFree(Runtime.getRuntime().freeMemory());
        jvm.setVersion(props.getProperty("java.version"));
        jvm.setHome(props.getProperty("java.home"));
    }

    /**
     * 设置磁盘信息
     */
    private void setSysFiles(OperatingSystem os) {
        FileSystem fileSystem = os.getFileSystem();
        OSFileStore[] fsArray = fileSystem.getFileStores();
        for (OSFileStore fs : fsArray) {
            long free = fs.getUsableSpace();
            long total = fs.getTotalSpace();
            long used = total - free;
            SysFile sysFile = new SysFile();
            sysFile.setDirName(fs.getMount());
            sysFile.setSysTypeName(fs.getType());
            sysFile.setTypeName(fs.getName());
            sysFile.setTotal(convertFileSize(total));
            sysFile.setFree(convertFileSize(free));
            sysFile.setUsed(convertFileSize(used));
            sysFile.setUsage(Arith.mul(Arith.div(used, total, 4), 100));
            sysFiles.add(sysFile);
        }
    }

    /**
     *
     */
    private void setServerInfo() {
        serverInfo.setJvmName(jvm.getName());
        serverInfo.setJdkVersion(jvm.getVersion());
        serverInfo.setServerIP(sys.getComputerIp());
        serverInfo.setServerName(sys.getComputerName());
        serverInfo.setServerOS(sys.getOsName());
        serverInfo.setServerArch(sys.getOsArch());
        serverInfo.setSysTypeName(sysFiles.get(0).getSysTypeName());
        serverInfo.setSysName(sysFiles.get(0).getTypeName());
    }
    /**
     * 字节转换
     *
     * @param size 字节大小
     * @return 转换后值
     */
    public String convertFileSize(long size) {
        long kb = 1024;
        long mb = kb * 1024;
        long gb = mb * 1024;
        if (size >= gb) {
            return String.format("%.1f GB", (float) size / gb);
        } else if (size >= mb) {
            float f = (float) size / mb;
            return String.format(f > 100 ? "%.0f MB" : "%.1f MB", f);
        } else if (size >= kb) {
            float f = (float) size / kb;
            return String.format(f > 100 ? "%.0f KB" : "%.1f KB", f);
        } else {
            return String.format("%d B", size);
        }
    }

}
