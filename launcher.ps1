# author:deepseekV3.1
# create_time:2025.9.11
# 设置控制台编码
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8
chcp 65001 | Out-Null

# 配置
$URL_FILE = "file.txt"
$DOWNLOAD_DIR = "files\downloads"
$LOG_FILE = "logs\download.log"
$SUCCESS_FILE = "logs\success.log"
$FAIL_FILE = "logs\fail.log"

# 创建目录
New-Item -ItemType Directory -Path $DOWNLOAD_DIR -Force | Out-Null
New-Item -ItemType Directory -Path "logs" -Force | Out-Null

# 清空日志
"" | Out-File $LOG_FILE -Encoding UTF8
"" | Out-File $SUCCESS_FILE -Encoding UTF8
"" | Out-File $FAIL_FILE -Encoding UTF8

Write-Host "==================================" -ForegroundColor Green
Write-Host "  File Download Tool - PowerShell" -ForegroundColor Yellow
Write-Host "==================================" -ForegroundColor Green
Write-Host "Starting download process..." -ForegroundColor Green
Add-Content -Path $LOG_FILE -Value "Download started at: $(Get-Date)"

# 统计URL数量
$urls = Get-Content $URL_FILE -Encoding UTF8 | Where-Object {
    $_.Trim() -and -not $_.Trim().StartsWith("#")
}
$urlCount = $urls.Count

Write-Host "Found $urlCount valid URLs" -ForegroundColor Yellow
Add-Content -Path $LOG_FILE -Value "Found $urlCount valid URLs"

# 下载计数器
$successCount = 0
$failCount = 0

# 下载文件
$index = 0
foreach ($url in $urls) {
    $url = $url.Trim()
    $index++
    
    # 提取文件名
    $original_filename = $url -replace '.*/', ''
    $filename = "$index" + "_" + $original_filename
    $filepath = Join-Path $DOWNLOAD_DIR $filename
    
    # 显示进度
    Write-Host "[$index/$urlCount] Downloading: $filename" -ForegroundColor Cyan
    Add-Content -Path $LOG_FILE -Value "[$index/$urlCount] Downloading: $filename"
    
    try {
        $webClient = New-Object System.Net.WebClient
        $webClient.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36")
        $webClient.DownloadFile($url, $filepath)
        
        # 检查文件是否下载成功
        if (Test-Path $filepath -PathType Leaf) {
            $size = (Get-Item $filepath).Length
            if ($size -gt 0) {
                Write-Host "  [SUCCESS] Downloaded ($size bytes)" -ForegroundColor Green
                Add-Content -Path $LOG_FILE -Value "  [SUCCESS] Downloaded ($size bytes)"
                Add-Content -Path $SUCCESS_FILE -Value "$index. $url -> $filepath ($size bytes)"
                $successCount++
            } else {
                Write-Host "  [ERROR] File is empty" -ForegroundColor Red
                Add-Content -Path $LOG_FILE -Value "  [ERROR] File is empty"
                Add-Content -Path $FAIL_FILE -Value "$index. $url -> Empty file"
                Remove-Item $filepath -Force -ErrorAction SilentlyContinue
                $failCount++
            }
        } else {
            Write-Host "  [ERROR] File not found" -ForegroundColor Red
            Add-Content -Path $LOG_FILE -Value "  [ERROR] File not found"
            Add-Content -Path $FAIL_FILE -Value "$index. $url -> File not found"
            $failCount++
        }
    }
    catch {
        Write-Host "  [ERROR] Download failed: $($_.Exception.Message)" -ForegroundColor Red
        Add-Content -Path $LOG_FILE -Value "  [ERROR] Download failed: $($_.Exception.Message)"
        Add-Content -Path $FAIL_FILE -Value "$index. $url -> $($_.Exception.Message)"
        Remove-Item $filepath -Force -ErrorAction SilentlyContinue
        $failCount++
    }
    
    # 短暂延迟
    if ($index -lt $urlCount) {
        Start-Sleep -Milliseconds 300
    }
}

# 显示统计信息
Write-Host "==================================" -ForegroundColor Green
Write-Host "Download completed!" -ForegroundColor Green
Write-Host "Total URLs: $urlCount" -ForegroundColor Yellow
Write-Host "Success: $successCount" -ForegroundColor Green
Write-Host "Failed: $failCount" -ForegroundColor Red

if ($urlCount -gt 0) {
    $successRate = [math]::Round(($successCount * 100 / $urlCount), 2)
    Write-Host "Success rate: ${successRate}%" -ForegroundColor Cyan
}

Write-Host "Files saved to: $DOWNLOAD_DIR" -ForegroundColor Cyan
Write-Host "Log file: $LOG_FILE" -ForegroundColor Gray
Write-Host "Press any key to exit..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")