═════════════════════════════════════════════════════════════════════════════
                    URL文件下载工具 - Windows版
                              简单易用，一键下载
                           作者: deepseekV3.1
                           创建时间: 2025.9.11
═════════════════════════════════════════════════════════════════════════════

【产品简介】
这是一个Windows平台的URL文件下载工具，专门设计用于批量下载URL列表中的文件。
无需任何技术背景，只需双击exe文件即可开始自动下载。

【使用方法 - 超简单！】

第一步：编辑URL列表
───────────────────────
打开 "file.txt" 文件，将需要下载的文件URL，一行一个，添加进去：

示例内容：
───────────────────────
https://example.com/image1.jpg
https://example.com/document.pdf
https://typora-zp.oss-cn-shanghai.aliyuncs.com/图片.png

第二步：开始下载
───────────────────────
双击运行：双击此处开始下载file.txt中的url内容.exe

第三步：查看结果
───────────────────────
下载的文件会自动保存到：files\downloads\ 目录

就这么简单！无需任何复杂配置！

【主要特性】

• 🚀 一键启动 - 双击exe文件即可开始下载
• 📝 简单配置 - 只需编辑file.txt文件添加URL
• 🔢 智能命名 - 自动添加数字序号前缀，避免文件覆盖
• 📊 进度显示 - 实时显示下载进度和状态
• 📋 详细日志 - 完整记录下载结果和错误信息
• 🎯 错误处理 - 自动跳过无效URL，记录失败原因
• 🖥️ 原生支持 - 完全基于Windows原生技术，无需安装额外软件

【目录结构说明】

download_url_tools_powershell/
├── 双击此处开始下载file.txt中的url内容.exe  ← 主程序，双击运行
├── file.txt                                  ← 编辑这个文件添加URL
├── launcher.bat                              ← 备用启动方式
├── launcher.ps1                              ← PowerShell脚本
├── README.txt                                ← 使用说明
├── files/
│   └── downloads/                            ← 下载的文件保存在这里
└── logs/
    ├── download.log                          ← 详细下载日志
    ├── success.log                           ← 成功下载列表
    └── fail.log                              ← 失败下载列表

【文件命名规则】

下载的文件会按以下规则自动重命名：

• 原始文件名：image.jpg → 下载后：1_image.jpg
• 原始文件名：照片.png → 下载后：2_照片.png
• 原始文件名：报告.pdf → 下载后：3_报告.pdf

数字序号对应file.txt中的URL顺序，确保文件不会重复或覆盖。

【下载过程说明】

1. 程序启动时会自动读取file.txt中的URL列表
2. 跳过空行和以#开头的注释行
3. 按顺序逐个下载文件
4. 每个下载完成后显示状态和文件大小
5. 最后显示完整的下载统计信息

【使用示例】

示例1：下载图片
───────────────────────
在file.txt中添加：
https://picsum.photos/800/600
https://example.com/风景.jpg
https://cdn.example.com/壁纸.png

双击exe开始下载，结果：
• files\downloads\1_800x600.jpg
• files\downloads\2_风景.jpg
• files\downloads\3_壁纸.png

示例2：下载文档
───────────────────────
在file.txt中添加：
https://example.com/手册.pdf
https://docs.example.com/教程.docx
https://guides.example.com/说明.txt

运行程序查看下载进度和结果

【多种启动方式】

方式一：主程序（推荐）
───────────────────────
双击：双击此处开始下载file.txt中的url内容.exe

方式二：批处理文件
───────────────────────
双击：launcher.bat

方式三：PowerShell脚本
───────────────────────
powershell -ExecutionPolicy Bypass -File "launcher.ps1"

【日志文件说明】

1. download.log - 详细日志
───────────────────────
记录每个文件的下载过程：
• 下载开始时间
• URL处理详情
• 成功/失败状态
• 文件大小信息
• 错误原因说明

2. success.log - 成功列表
───────────────────────
记录成功下载的文件：
1. https://example.com/pic.jpg → files\downloads\1_pic.jpg (102400 bytes)
2. https://example.com/doc.pdf → files\downloads\2_doc.pdf (256000 bytes)

3. fail.log - 失败列表
───────────────────────
记录下载失败的URL：
1. https://invalid.com/missing.jpg → 404 Not Found
2. https://timeout.com/large.pdf → Request Timeout

【系统要求】

• 操作系统：Windows 7 / 8 / 10 / 11
• 网络：正常的互联网连接
• 权限：正常的文件读写权限

无需安装任何额外软件！

【常见问题】

Q: 程序无法启动？
A: 请确保使用的是Windows系统，并且有文件读写权限

Q: 下载失败的文件怎么办？
A: 查看logs\fail.log了解失败原因，检查URL是否有效

Q: 可以下载中文文件名的文件吗？
A: 完全支持！程序专门优化了中文文件名处理

Q: 下载速度很慢？
A: 程序内置下载间隔，避免对服务器造成压力，这是正常现象

Q: 如何暂停或停止下载？
A: 直接关闭程序窗口即可停止下载

【安全说明】

• 本程序仅为文件下载工具，不会收集或上传任何个人信息
• 下载的文件保存在本地，不会自动执行
• 建议下载完成后使用杀毒软件扫描文件
• 请确保下载的URL来源可靠

【更新日志】

v1.0 (2025.9.11)
• 发布初始版本
• 支持一键批量下载
• 添加智能文件命名
• 完善的日志记录功能

【技术支持】

如有问题或建议，请查看：
• 详细日志：logs\download.log
• 失败记录：logs\fail.log
• 联系项目维护者获取帮助

═════════════════════════════════════════════════════════════════════════════
                           使用说明总结：

1. 编辑 file.txt 添加下载URL
2. 双击 exe 文件开始下载
3. 在 files\downloads\ 目录查看结果

就这么简单！享受便捷的批量下载体验！
═════════════════════════════════════════════════════════════════════════════