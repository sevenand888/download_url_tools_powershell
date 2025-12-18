# URL 文件下载工具 (PowerShell版)

一个强大的Windows批量文件下载工具，支持从URL列表下载文件，自动重命名防止文件覆盖，并提供详细的下载日志。

## 📋 功能特性

- ✅ **一键启动**: 双击exe文件即可开始批量下载
- ✅ **简单配置**: 只需编辑file.txt文件添加URL列表
- ✅ **智能命名**: 自动添加数字序号前缀，防止文件重名覆盖
- ✅ **进度显示**: 实时显示下载进度和状态信息
- ✅ **详细日志**: 完整记录下载过程、成功/失败列表
- ✅ **错误处理**: 自动跳过无效URL，提供详细错误信息
- ✅ **多语言支持**: 完全支持中文文件名和路径
- ✅ **原生兼容**: 基于Windows原生技术，无需安装额外软件

## 🚀 快速开始

### 1. 准备URL列表

将需要下载的文件URL，一行一个，添加到 `file.txt` 中：

```bash
# file.txt 示例内容
https://example.com/image1.jpg
https://example.com/documents/报告.pdf
https://typora-zp.oss-cn-shanghai.aliyuncs.com/图片.png
# 这是注释行，会被自动忽略
https://example.com/files/data.csv
```

### 2. 运行下载程序

**主程序方式（推荐）:**
```bash
# 双击运行exe文件
双击此处开始下载file.txt中的url内容.exe
```

**备用启动方式:**
```bash
# 双击运行批处理文件
launcher.bat

# 或使用PowerShell命令
powershell -ExecutionPolicy Bypass -File "launcher.ps1"
```

### 3. 查看下载结果

- 下载的文件保存在: `files/downloads/` 目录
- 查看详细日志: `logs/download.log`
- 查看成功列表: `logs/success.log`
- 查看失败列表: `logs/fail.log`

就这么简单！无需任何复杂配置！

## 📁 目录结构

```
.
├── 双击此处开始下载file.txt中的url内容.exe    # 主程序，双击运行
├── launcher.bat                              # 批处理启动文件
├── launcher.ps1                              # PowerShell主脚本
├── README.md                                 # 说明文档
├── file.txt                                  # URL列表文件（需要手动编辑）
├── .gitignore                                # Git忽略文件
├── files/
│   └── downloads/                            # 下载文件存放目录
└── logs/
    ├── download.log                          # 详细下载日志
    ├── success.log                           # 成功下载列表
    └── fail.log                              # 失败下载列表
```

## 🔧 文件命名规则

下载的文件会按以下规则重命名：

- **格式**: `{序号}_{原始文件名}`
- **示例**:
  - `1_image1.jpg`
  - `2_报告.pdf`
  - `3_图片.png`

序号对应 `file.txt` 中的URL顺序，确保文件不会意外覆盖。

## 📊 日志文件说明

### download.log
完整的下载过程日志，包含：
- 下载开始/结束时间
- 每个文件的处理详情
- 成功/失败状态和原因
- 文件大小信息
- 最终统计信息

### success.log
记录成功下载的文件信息：
```
1. https://example.com/image1.jpg -> files\downloads\1_image1.jpg (102400 bytes)
2. https://example.com/document.pdf -> files\downloads\2_document.pdf (256000 bytes)
```

### fail.log
记录下载失败的URL：
```
1. https://failed-example.com/missing.jpg -> 404 Not Found
2. https://timeout-example.com/large.pdf -> Request Timeout
```

## ⚙️ 配置选项

脚本中的主要配置参数：

```powershell
# 文件路径配置
$URL_FILE = "file.txt"                    # URL列表文件
$DOWNLOAD_DIR = "files\downloads"         # 下载目录
$LOG_FILE = "logs\download.log"           # 主日志文件
$SUCCESS_FILE = "logs\success.log"        # 成功日志
$FAIL_FILE = "logs\fail.log"              # 失败日志

# 下载参数配置
Start-Sleep -Milliseconds 300             # 下载间隔（毫秒）
User-Agent: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"
```

## 🛠️ 环境要求

- **操作系统**: Windows 7 / 8 / 10 / 11
- **PowerShell版本**: 3.0 或更高 (Windows 7需要安装PowerShell 3.0+)
- **网络**: 正常的互联网连接
- **权限**: 正常的文件读写权限

### 检查PowerShell版本
```powershell
$PSVersionTable.PSVersion
```

## 📝 使用示例

### 示例1：下载图片
```powershell
# 创建URL列表
echo "https://picsum.photos/800/600" > file.txt
echo "https://example.com/风景.jpg" >> file.txt
echo "https://cdn.example.com/壁纸.png" >> file.txt

# 双击exe开始下载
# 结果：files\downloads\1_800x600.jpg, 2_风景.jpg, 3_壁纸.png
```

### 示例2：下载文档
```powershell
# 编辑file.txt内容
https://example.com/手册.pdf
https://docs.example.com/教程.docx
https://guides.example.com/说明.txt

# 运行程序查看下载进度
```

### 示例3：批量处理
```powershell
# 使用PowerShell生成URL列表
1..10 | ForEach-Object { "https://picsum.photos/800/600?image=$_" } > file.txt

# 批量下载
./双击此处开始下载file.txt中的url内容.exe

# 检查结果
echo "成功下载: $(Get-Content logs\success.log | Measure-Object -Line).Lines 个文件"
echo "失败数量: $(Get-Content logs\fail.log | Measure-Object -Line).Lines 个文件"
```

## 🔍 故障排除

### 常见问题

1. **程序无法启动**
   - 确保使用的是Windows系统
   - 检查是否有文件读写权限
   - 确认PowerShell版本符合要求

2. **下载失败率高**
   - 检查网络连接
   - 验证URL是否有效
   - 查看 `logs/fail.log` 获取详细错误信息

3. **文件为空或损坏**
   - 程序会自动检测并删除空文件
   - 检查源URL是否可正常访问

4. **中文文件名问题**
   - 完全支持中文文件名
   - 确保控制台编码设置为UTF-8

5. **下载速度慢**
   - 程序内置300毫秒下载间隔，避免对服务器造成压力
   - 这是正常现象，有助于保护服务器资源

### 清理缓存
```powershell
# 清理下载的文件
Remove-Item files\downloads\* -Force -Recurse

# 清理日志文件
"" | Out-File logs\download.log -Encoding UTF8
"" | Out-File logs\success.log -Encoding UTF8
"" | Out-File logs\fail.log -Encoding UTF8
```

## 📈 性能特点

- **用户友好**: 一键启动，无需技术背景
- **内存高效**: 逐行处理，不会占用大量内存
- **网络友好**: 内置下载间隔，避免对服务器造成压力
- **错误恢复**: 自动重试和异常处理机制
- **稳定性高**: 基于Windows原生技术，兼容性强

## 🔒 安全说明

- **隐私保护**: 仅作为下载工具，不会收集或上传个人信息
- **文件安全**: 下载的文件保存在本地，不会自动执行
- **建议措施**: 建议下载完成后使用杀毒软件扫描文件
- **来源验证**: 请确保下载的URL来源可靠

## 📊 多种启动方式对比

| 启动方式 | 优点 | 缺点 | 推荐场景 |
|---------|------|------|----------|
| **exe文件** | 一键启动，最简单 | 文件较大 | 日常使用推荐 |
| **bat文件** | 文件小，可编辑 | 需要PowerShell环境 | 备用启动方式 |
| **PowerShell脚本** | 可自定义，灵活 | 需要命令行知识 | 高级用户定制 |

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 许可证

MIT License

## 👤 项目信息

- **项目名称**: URL 文件下载工具 (PowerShell版)
- **版本**: v4.0
- **作者**: vxhs888p
- **组织**: linuxjk.cn
- **创建时间**: 2025.9.11

---

## 🎯 快速上手总结

1. **编辑**: 打开 `file.txt` 文件，添加下载URL
2. **运行**: 双击 `双击此处开始下载file.txt中的url内容.exe`
3. **查看**: 在 `files/downloads/` 目录查看下载结果

**就这么简单！享受便捷的批量下载体验！**

---

⚠️ **注意**: 请遵守相关网站的 robots.txt 和使用条款，合理使用下载工具。