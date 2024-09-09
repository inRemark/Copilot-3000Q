# Java 有哪些常用命令？

Java 提供了一系列常用命令，用于编译、运行和管理 Java 应用程序。以下是一些常用的 Java 命令及其简要说明：

## 编译和运行 Java 程序

1.`javac`

- 用于编译 `Java` 源代码文件（`.java`）生成字节码文件（`.class`）。

```sh
javac HelloWorld.java
```

2.`java`

- 执行编译后的字节码文件（`.class`）。

```sh
java HelloWorld
 ```

## 包管理和文档生成

3.`jar`

- 创建、查看、更新和提取 JAR（Java ARchive）文件

```sh
jar cvf app.jar -C bin .
```

4.`javadoc`

- 用于生成 Java 源代码的 API 文档

```sh
javadoc -d doc src/com/example/*java
```

## 调试和分析

5.`jps`
Java 进程状态工具，用于列出当前运行的 Java 进程

```sh
jps
jps -l
```

6.`jdb`

Java 调试器，用于调试 Java 程序

```sh
jdb HelloWorld
```

7.`jstack`

打印 Java 进程的线程堆栈，帮助诊断线程问题

```sh
jstack <pid>
jstack -l <pid> > stack_file.txt

# Thread Status
# RUNNABLE      在虚拟机内执行的
# BLOCKED       受阻塞并等待监视器锁
# WAITING       无限期等待另一个线程执行特定操作。
# TIMED_WAITING 有时限的等待另一个线程的特定操作
# TERMINATED    已退出的

# 分析工具
IBM Thread and Monitor Dump Analyzer for Java (TMDA) 
https://www.ibm.com/support/pages/ibm-thread-and-monitor-dump-analyzer-java-tmda

```

8.`jmap`

生成 Java 进程的内存映像（heap dump），帮助分析内存使用情况

```sh
jmap -histo <pid> > f.txt    
jmap -histo:live <pid> f.txt  
jmap -dump:format=b,file=heap.bin <pid>

# 分析工具
Eclipse Memory Analyzer（MAT）
https://eclipse.dev/mat/downloads.php
```

9.`jstat`

Java 虚拟机统计监视工具，用于监视 JVM 的性能统计信息

```sh
# jstat [-命令选项] [vmid] [间隔时间/毫秒] [查询次数]
jstat -gc <pid>         # 垃圾回收统计
jstat -gcutil <pid>     # 总结垃圾回收统计
jstat -class <pid>      # 类加载
```

10.`jcmd`

发送诊断命令到 JVM

```sh
jcmd <pid> VM.system_properties
```

11.`jinfo`

显示 Java 进程的配置信息

```sh
jinfo <pid>
```

## 其他工具

12.`javap`

Java 类文件反汇编工具，用于反汇编 `.class` 文件

13.`keytool`
Java 密钥和证书管理工具，用于管理密钥库和证书

```sh
keytool -genkeypair -alias mykey -keyalg RSA -keystore mykeystore.jks
```
