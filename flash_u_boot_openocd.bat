@echo off
setlocal

set OPENOCD=openocd
set IMAGE=u-boot.bin
set FLASH_ADDR=0x08000000

if not exist "%IMAGE%" (
    echo File not found: %IMAGE%
    echo Run this script from the U-Boot build directory.
    exit /b 1
)

%OPENOCD% -f interface/stlink.cfg -f target/stm32f7x.cfg -c "program %IMAGE% %FLASH_ADDR% verify reset exit"

endlocal
