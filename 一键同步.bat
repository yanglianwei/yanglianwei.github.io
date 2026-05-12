@echo off
chcp 65001 >nul
echo 正在同步主页到 GitHub（自动重试）...

:: 进入你的本地项目文件夹（绝对路径，不用改）
cd /d "C:\Users\yanglianwei\Desktop\资料夹\12.找工作\Homepage\yanglianwei.github.io-master"

:: 1. 添加所有改动（新增/修改/删除）
git add -A

:: 2. 提交改动（带时间戳）
git commit -m "Update yanglianwei.github.io: %date% %time%"

:: 3. 自动重试推送，直到成功
:RETRY
git push
if %errorlevel% equ 0 (
    echo.
    echo ✅ 同步成功！按任意键退出...
    pause >nul
    exit
)
echo ❌ 推送失败，5秒后自动重试...
timeout /t 5 /nobreak >nul
goto RETRY
