@echo off
rem ***********************************************************************
rem This file is provided under MIT License:
rem http://www.opensource.org/licenses/mit-license.phprem 
rem
rem This batch file is a extended cd command.
rem This could save the history and also jump in the histories. 
rem For detail help, type <filename> /?
rem
rem Author: Programus (programus@gmail.com)
rem gist url: 
rem https://gist.github.com/programus/2d2738b2a746140186f7738b678bdcec
rem
rem this tool need or create 2 temporary files: 
rem   %TEMP%\dir-list.tmp
rem   %TEMP%\dir-prev.tmp
rem ***********************************************************************

if /i [%1]==[/help] goto :printhelp
if /i [%1]==[/h] goto :printhelp
if [%1]==[/?] goto :printhelp

goto :main

:printhelp
echo %~n0                 - display all saved path with leading id and name followed if any
echo %~n0 ^<path^>          - save current path and jump to ^<path^>
echo %~n0 :^<n^|name^>       - jump to the Nth or named path in the saved list
echo %~n0 :               - jump to previous path
echo %~n0 name ^<n^>:^<name^> - name the Nth path as ^<name^>
echo %~n0 rm [:]^<n^|name^>  - remove the Nth or named path from the list
echo %~n0 clear           - clear the list
echo %~n0 /help           - print out this help
echo %~n0 /?              - same as above

goto :allover

:main
setlocal EnableDelayedExpansion

set tp=%TEMP%\dir-prev.tmp
set tf=%TEMP%\dir-list.tmp

rem extract previous path
set /p ppth=<%tp%

rem read list from file
set len=0
for /f "tokens=*" %%p in (%tf%) do (
  set /a "len+=1"
  set lines[!len!]=%%p
  for /f "tokens=1,2 delims=;" %%a in ("%%p") do set pp=%%a&set nn=%%b
  set list[!len!]=!pp!
  set list[!nn!]=!pp!
  set names[!len!]=!nn!
)

rem list all history
if [%1]==[] (
  for /l %%i in (1,1,%len%) do (
    set nm=
    if not "!names[%%i]!"=="" set nm=   ^<--^<^<^<^ (!names[%%i]!^)
    echo [%%i] !list[%%i]!!nm!
  )
  goto :end
)

rem goto previous directory and store current
if [%1]==[:] (
  rem get the previous path
  set pth="%ppth%"
  set pth=!pth:"=!
  goto :savecd
)

rem clear all
if /i [%1]==[clear] (
  set len=0
  goto :write
)

rem name an item
if /i [%1]==[name] (
  for /f "tokens=1,2 delims=:" %%a in ("%2") do set no=%%a&set name=%%b
  if not "!name!"=="" (
    set notNumeric=
    for /f "delims=0123456789" %%x in ("!name!") do set notNumeric=%%x
    if not defined notNumeric (
      echo Error: name cannot be a number.
      goto :allover
    )
    for /l %%i in (1,1,%len%) do (
      set nm=!names[%%i]!
      if "!nm!"=="!name!" (
        echo Error: name has been existed.
        goto :allover
      )
    )
  )
  set names[!no!]=!name!
  goto :write
)

rem mark index should be removed
if /i [%1]==[rm] (
  set rmno=%2
  rem check names which is a non-numeric
  set notNumeric=
  for /f "delims=0123456789" %%x in ("%rmno%") do set notNumeric=%%x
  if not defined notNumeric (
    rem parameter is a name, find out the index
    for /l %%i in (1,1,%len%) do (
      set nm=!names[%%i]!
      if "!nm!"=="!rmno!" (
        set rmno=%%i
        goto :endloopname
      )
    )
  )
:endloopname
  goto :write
)

rem other cases
rem store the argument as path
set pth=%1
rem remove all double-quotation
set pth=%pth:"=%
if [%pth:~0,1%]==[:] (
  rem start with ':', mean jump to a history record
  rem get the real path
  set pth=!list[%pth::=%]!
)
:savecd
rem store current path into history
set /a "len+=1"
set list[!len!]=%cd%
set lines[!len!]=%cd%

:write
rem write back to file
echo off
set j=0
(for /l %%i in (1,1,%len%) do (
  rem do not save rm directory
  if not [%%i]==[%rmno::=%] (
    set pt=!list[%%i]!
    rem find out whether current directory is written already
    for /l %%k in (0,1,!j!) do (
      if /i "!pt!"=="!written[%%k]!" (
        rem if it is written already, mark as included
        set included=T
      )
    )
    if not "!included!"=="T" (
      rem only write the directory if it is not written already, not included.
      echo !pt!;!names[%%i]!
      rem mark the directory as written
      set /a "j+=1"
      set written[!j!]=!pt!
    )
  )
)) > %tf%

rem save current path as previous path
if /i not "%pth%"=="%cd%" (
  if defined pth (
    call :printcd "%tp%"
  )
)
:end
endlocal && set __pth=%pth%

rem change directory
if defined __pth (
  cd /d "%__pth%"
  set __pth=
)

:allover
exit /b 0

:printcd
echo %cd%>%1
exit /b 0