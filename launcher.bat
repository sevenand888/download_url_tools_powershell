@echo off
chcp 65001 >nul
pushd %~dp0

echo ==================================
echo   文件下载工具 - PowerShell版本
echo ==================================
echo.

:: 检查PowerShell版本
powershell -Command "if ($PSVersionTable.PSVersion.Major -lt 3) { exit 1 }"
if errorlevel 1 (
    echo 错误: 需要PowerShell 3.0或更高版本
    pause
    exit /b 1
)

:: 检查URL文件
if not exist "file.txt" (
    echo 错误: 找不到 file.txt
    echo.
    echo 请创建 file.txt 文件，内容格式:
    echo https://example.com/中文文件.png
    echo https://example.com/另一个文件.jpg
    echo.
    echo 当前目录文件列表:
    dir /b
    pause
    exit /b 1
)

:: 运行PowerShell脚本
echo 正在启动下载程序...
echo.
powershell -ExecutionPolicy Bypass -File "launcher.ps1"