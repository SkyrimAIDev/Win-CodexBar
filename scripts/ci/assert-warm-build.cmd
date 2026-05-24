@echo on
setlocal

set "VERSION="
for /f "tokens=3" %%A in ('findstr /b /c:"version = " rust\Cargo.toml') do (
  if not defined VERSION set "VERSION=%%~A"
)

if not defined VERSION (
  echo Failed to determine version from rust\Cargo.toml
  exit 1
)

set "WARM_EXE=C:\code\Win-CodexBar-release\assets\CodexBar-%VERSION%-warm.exe"
if not exist "%WARM_EXE%" (
  echo Missing warm build artifact: %WARM_EXE%
  exit 1
)

echo Found warm build artifact: %WARM_EXE%
exit 0
