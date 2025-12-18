═════════════════════════════════════════════════════════════════════════════
                    PowerShell 文件下载工具 v1.0
                              作者: deepseekV3.1
                           创建时间: 2025.9.11
═════════════════════════════════════════════════════════════════════════════

【功能简介】
这是一个基于PowerShell的批量文件下载工具，可以从URL列表中批量下载文件，
自动为文件添加数字序号前缀防止重名，并提供详细的下载日志。

【主要特性】
• 批量下载: 从file.txt中读取URL列表，自动批量下载
• 智能命名: 自动添加数字序号前缀，防止文件重名覆盖
• 进度显示: 实时显示下载进度和状态
• 详细日志: 完整记录下载过程、成功/失败列表
• 错误处理: 自动检测空文件，提供详细错误信息
• 统计分析: 显示下载成功率和统计信息

【使用方法】

方法一: 双击运行 (推荐)
─────────────────────
1. 双击 "launcher.bat" 文件
2. 程序会自动检查环境和文件
3. 开始批量下载

方法二: 命令行运行
─────────────────────
powershell -ExecutionPolicy Bypass -File "launcher.ps1"

【文件准备】

1. 编辑URL列表文件 (file.txt)
─────────────────────────────────
将需要下载的文件URL，一行一个，添加到file.txt中：

示例内容：
───────────────────────
https://example.com/image1.jpg
https://example.com/images/photo (1).png
https://example.com/documents/报告.pdf
# 这是注释行，会被忽略
https://example.com/files/data.csv

注意事项：
• 每行一个URL
• 支持#开头的注释行
• 空行会被自动跳过
• 支持中文文件名

2. 目录结构说明
───────────────────────
download_url_tools_powershell/
├── launcher.bat          ← 双击运行这个文件
├── launcher.ps1          ← PowerShell主脚本
├── file.txt              ← 编辑这个文件添加URL
├── files/
│   └── downloads/        ← 下载的文件保存在这里
└── logs/
    ├── download.log      ← 详细下载日志
    ├── success.log       ← 成功下载列表
    └── fail.log          ← 失败下载列表

【下载结果】

文件命名规则：
───────────────────────
• 格式: {序号}_{原始文件名}
• 示例: 1_image1.jpg, 2_photo (1).png, 3_报告.pdf

下载完成后会显示：
───────────────────────
• 总URL数量
• 成功下载数量
• 失败下载数量
• 成功率百分比
• 文件保存位置

【环境要求】

• 操作系统: Windows 7/8/10/11
• PowerShell版本: 3.0 或更高 (Windows 7需要安装PowerShell 3.0+)
• 网络: 正常的互联网连接

【使用示例】

示例1: 下载图片
───────────────────────
在file.txt中添加：
https://picsum.photos/800/600
https://picsum.photos/900/700
https://picsum.photos/1000/800

双击launcher.bat开始下载

示例2: 下载文档
───────────────────────
在file.txt中添加：
https://example.com/documents/手册.pdf
https://example.com/files/教程.docx
https://example.com/guides/说明书.ppt

运行程序查看下载进度

【日志文件说明】

1. download.log (详细日志)
───────────────────────
记录完整的下载过程：
• 下载开始时间
• 每个文件的处理详情
• 成功/失败状态和原因
• 文件大小信息
• 最终统计信息

2. success.log (成功列表)
───────────────────────
记录成功下载的文件：
1. https://example.com/image1.jpg -> files\downloads\1_image1.jpg (102400 bytes)
2. https://example.com/photo.jpg -> files\downloads\2_photo.jpg (256000 bytes)

3. fail.log (失败列表)
───────────────────────
记录下载失败的URL：
1. https://failed.com/missing.jpg -> Empty file
2. https://timeout.com/large.pdf -> Download failed: 超时

【常见问题】

Q: 程序提示"需要PowerShell 3.0或更高版本"
A: 请升级PowerShell版本或使用更高版本的Windows系统

Q: 下载的文件是空文件
A: 程序会自动检测并删除空文件，失败信息会记录在fail.log中

Q: 下载速度很慢
A: 程序内置了300毫秒的下载间隔，避免对服务器造成太大压力

Q: 支持哪些类型的文件
A: 支持所有可以通过HTTP/HTTPS直接下载的文件类型

Q: 如何下载带有特殊字符的URL
A: PowerShell会自动处理大部分特殊字符，包括中文文件名

【安全说明】

• 程序仅从指定的URL下载文件
• 不会收集或上传任何个人信息
• 下载的文件保存在本地，不会自动执行
• 建议下载后使用杀毒软件扫描文件

【更新日志】

v1.0 (2025.9.11)
• 初始版本发布
• 支持批量下载和自动命名
• 添加详细的日志记录
• 支持中文显示和文件名

【联系方式】

如有问题或建议，请联系项目维护者。

═════════════════════════════════════════════════════════════════════════════
使用愉快！如果这个工具对你有帮助，欢迎给个Star支持一下！
═════════════════════════════════════════════════════════════════════════════