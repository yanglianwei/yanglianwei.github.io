@echo off
chcp 65001 >nul
echo 正在同步主页到 GitHub（自动重试）...
cd /d "%~dp0"

git add -A
git commit -m "Update yanglianwei.github.io: %date% %time%"

:RETRY
git push
if %errorlevel% equ 0 (
    echo.
    echo ✅ 同步成功！已推送到 main 分支！
    pause >nul
    exit
)
echo ❌ 推送失败，5秒后自动重试...
timeout /t 5 /nobreak >nul
goto RETRY
