# 部署到 clinic.tingdds.com/sop （Cloudflare Pages 專案：clinic）
# 用法：改完 index.html 後，在本資料夾執行 .\deploy-clinic.ps1
$ErrorActionPreference = "Stop"
$d = Join-Path $PSScriptRoot ".deploy"
if (Test-Path $d) { Remove-Item $d -Recurse -Force }
New-Item -ItemType Directory -Force (Join-Path $d "sop") | Out-Null
Copy-Item (Join-Path $PSScriptRoot "index.html") (Join-Path $d "sop\index.html")
Set-Content (Join-Path $d "_redirects") -Value "/ /sop/ 302" -NoNewline
npx wrangler pages deploy $d --project-name clinic --branch main --commit-dirty=true
