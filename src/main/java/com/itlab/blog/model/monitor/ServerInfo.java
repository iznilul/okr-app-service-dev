package com.itlab.blog.model.monitor;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: blog
 * @description:
 * @author: radCircle
 * @create: 2021-08-08 19:57
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ServerInfo {
    private String jvmName;
    private String jdkVersion;
    private String serverIP;
    private String serverName;
    private String serverOS;
    private String serverArch;
    private String sysTypeName;
    private String sysName;
}
