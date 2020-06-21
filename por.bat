@echo off 

Rem auto compile .java files

setlocal

    if [%1] == []  goto compile_only else goto execute_only

    :execute_only
        set cute_path=%1
        echo por::EXECUTING %cute_path%
        java -cp .\bin %cute_path%
        goto :end

    :compile_only
        echo por::COMPILING
        call :fcompile
        goto :end


:end
exit /b %ERRORLEVEL% 

:fcompile
    set "source=zxRIpDx.txt"
    set "target=zLnkuMs.txt"

    dir /b /s *.java > %source%

    for %%a in (%source%) do set size=%%~za

    if %size%==0 call :fnoFile

    set "replace=%CD%\"
    set "replaced="

    setlocal enableDelayedExpansion
    (
        for /F "tokens=1* delims=:" %%a in ('findstr /N "^" %source%') do (
            set "line=%%b"
            if defined line set "line=!line:%replace%=%replaced%!"
                echo(!line!)
        ) > %target%
    endlocal

    javac -d .\bin @%target%
    echo por::AUTO COMPILE COMPLETE
    
exit /b 0

:fnoFile
    echo por::error:no java file found
    del %source%
exit /b 0

