@echo off
:: This batch script provides a menu to run common commands for the Invoice System project.
:: Ensure that the file is saved in Windows (CRLF) format e.g. Netbeans bottom right corner

title Invoice System Command Menu
cd /d "%~dp0"

:menu
cls
echo =======================================
echo         YII SENTRY
echo =======================================
echo [1] Run PHP Psalm
echo [2] Run PHP Psalm on a Specific File
echo [2a] Clear Psalm's cache (in the event of stubborn errors)
echo [3] Check Composer Outdated
echo [3a] Composer why-not {repository eg. yiisoft/yii-demo} {patch/minor version e.g. 1.1.1}
echo [4] Run Composer Update
echo [5] Run Composer Require Checker
echo [5a] Run PhpUnit tests
echo [6] Exit
echo [7] Exit to Current Directory
echo =======================================
set /p choice="Enter your choice [1-7]: "

if "%choice%"=="1" goto psalm
if "%choice%"=="2" goto psalm_file
if "%choice%"=="2a" goto psalm_clear_cache
if "%choice%"=="3" goto outdated
if "%choice%"=="3a" goto composerwhynot
if "%choice%"=="4" goto composer_update
if "%choice%"=="4a" goto node_modules_update
if "%choice%"=="4b" goto nvm_install_or_update
if "%choice%"=="5" goto require_checker
if "%choice%"=="5a" goto php_unit_tests
if "%choice%"=="6" goto exit
if "%choice%"=="7" goto exit_to_directory
echo Invalid choice. Please try again.
pause
goto menu

:psalm
echo Running PHP Psalm...
php vendor/bin/psalm
pause
goto menu

:psalm_file
echo Running PHP Psalm on a specific file...
set /p file="Enter the path to the file (relative to the project root): "
if "%file%"=="" (
    echo No file specified. Returning to the menu.
    pause
    goto menu
)
php vendor/bin/psalm "%file%"
pause
goto menu

:psalm_clear_cache
echo Running PHP Psalm...
php vendor/bin/psalm --clear-cache
pause
goto menu

:outdated
echo Checking Composer Outdated...
composer outdated
pause
goto menu

:composerwhynot
@echo off
set /p repo="Enter the package name (e.g. vendor/package): "
set /p version="Enter the version (e.g. 1.0.0): "
composer why-not %repo% %version%
pause
goto menu

:require_checker
echo Running Composer Require Checker...
php vendor/bin/composer-require-checker
pause
goto menu

:php_unit_tests
echo Running Php Unit Tests...
php vendor/bin/phpunit
pause
goto menu


:composer_update
echo Running Composer Update...
composer update
pause
goto menu

:exit_to_directory
echo Returning to the current directory. Goodbye!
cmd

:exit
echo Exiting. Goodbye!
pause
exit