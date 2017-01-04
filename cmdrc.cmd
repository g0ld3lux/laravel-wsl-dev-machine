@echo off

REM Important! Add this to Your Registry
REM regedit then go to: 
REM HKEY_CURRENT_USER\Software\Microsoft\Command Processor\AutoRun 
REM create new String Value => "%USERPROFILE%\.dotfiles\cmd\cmdrc.cmd"

REM Load User Aliases

DOSKEY /macrofile=%USERPROFILE%\.dotfiles\cmd\user-aliases.cmd
REM Im Using alias.bat Added in my %USERPROFILE%\bin\alias.bat
REM I can Easily Add Edit Delete Reload new Aliases
REM User CMDs ie: alias.bat
DOSKEY bin=cd %USERPROFILE%\bin

REM CD Shortcuts
DOSKEY ..=cd ..
DOSKEY ...=cd ../..
DOSKEY .3=cd ../../..
DOSKEY .4=cd ../../../..
DOSKEY .5=cd ../../../../..

REM Im Using cdx.bat Added in my %USERPROFILE%\bin\cdx.bat 
REM I can Easily Save Directory and Go back and Forth With this Batch File

REM Listing Directory Shortcut in Linux
DOSKEY l=bash -c "ls -lah"
DOSKEY la=bash -c "ls -Al"
DOSKEY lc=bash -c "ls -lcr"
DOSKEY ld=bash -c "ls -ltr"
DOSKEY ll=bash -c "ls -lh"
DOSKEY lm=bash -c "ls -al | more"
DOSKEY ls=bash -c "ls -aF --color=always"
DOSKEY lt=bash -c "ls -lur"
DOSKEY lx=bash -c "ls -lXB"
DOSKEY lz=bash -c "ls -lSr"

REM File and Folder Permission in Linux
DOSKEY mx=bash -c "chmod a+x $*"
DOSKEY 000=bash -c "chmod 000 $*"
DOSKEY 644=bash -c "chmod 644 $*"
DOSKEY 755=bash -c "chmod 755 $*"

REM System Info Short Cut
DOSKEY c=cls
DOSKEY clear=cls
DOSKEY pwd=bash -c "pwd"
DOSKEY tv=tree /f
DOSKEY hs= DOSKEY /history
DOSKEY ps=bash -c "ps auxf"
DOSKEY pg=bash -c "ps aux | grep $*"
DOSKEY mountedinfo=bash -c "df -hT"
DOSKEY ping=bash -c "ping -c 10 $*"
DOSKEY du1=bash -c "du -h --max-depth=1"
DOSKEY da=bash -ic date "+%Y-%m-%d %A    %T %Z"
DOSKEY touch=bash -c "touch $*"
DOSKEY rm=bash -c "rm $*"
DOSKEY mv=bash -c "mv $*"
DOSKEY cp=bash -c "cp $*"


REM Add Here All Your Text Editor
DOSKEY np=notepad $*
REM Im Using VS Code Insider so I Tweak it to use code alias
DOSKEY code=code-insiders $*

REM Browse Thru Folder
DOSKEY e=explorer $*

REM Edit System Variable
DOSKEY editenv=rundll32 sysdm.cpl,EditEnvironmentVariables

REM Edit Hosts File
DOSKEY hosts=code-insiders %SYSTEMROOT%\System32\drivers\etc\hosts

REM Edit My DOT Files and Configuration Files
DOSKEY cmdrc=code-insiders %USERPROFILE%\.dotfiles\cmd\cmdrc.cmd
DOSKEY aliases=code-insiders %USERPROFILE%\.dotfiles\cmd\user-aliases.cmd
DOSKEY aliasbat=code-insiders %USERPROFILE%\bin\alias.bat
DOSKEY cdxbat=code-insiders %USERPROFILE%\bin\cdx.bat
DOSKEY bashprofile=code-insiders %USERPROFILE%\.dotfiles\.bash_profile
DOSKEY minttyrc=code-insiders %LOCALAPPDATA%\wsltty\home\Uriah\.minttyrc
REM This is Where I Place All My Bash Alises , Zsh Aliases For SWL
DOSKEY dotfiles= cd %USERPROFILE%\.dotfiles

REM System  Shortcut
DOSKEY h=cd %USERPROFILE%
DOSKEY home=cd %USERPROFILE%
DOSKEY windir=cd %SYSTEMROOT%
DOSKEY system32= cd %SYSTEMROOT%\System32
DOSKEY tmp= cd %TMP%
DOSKEY tx=cd temp$tdir/w $*

REM SET Here ALL Your Work Related Directory
DOSKEY user=cd %USERPROFILE%
DOSKEY sites=cd %USERPROFILE%\Sites

REM Your WSL Shared Folder Directory
DOSKEY wsl=cd %LOCALAPPDATA%\Lxss\rootfs
DOSKEY uriah=cd %LOCALAPPDATA%\lxss\home\uriah
DOSKEY root=cd %LOCALAPPDATA%\lxss\root

REM Bashrc Functions , Check Your Bashrc , BashProfile , BashAliases
REM Laravel Based Functions
REM Im Using Ack not Grep in Routes function so it is Required to be Installed in your WSL
DOSKEY routes=bash -ic "routes $*"
DOSKEY logs=bash -ic logs
REM Create Ctags in your Project to Easily Search Functions
DOSKEY tagsInit=bash -ic tagsInit
REM String Related Functions
DOSKEY ff=bash -ic "ff $*"
DOSKEY fstr=bash -ic "fstr $1 $2"

REM Folder Management Functions
DOSKEY mcd=md $1$tcd $1
DOSKEY envpath=bash -ic envpath
DOSKEY swap=bash -ic "swap $1 $2"
DOSKEY sanitize=bash -ic "sanitize $*"

REM Archive Functions (required neccessary package to work)
DOSKEY maketar=bash -ic "maketar $1"
DOSKEY makezip=bash -ic "makezip $1"
DOSKEY extract=bash -ic "extract $*"

REM PHP Dev Tools
DOSKEY php=bash -ic "php $*"
DOSKEY phpenmod=bash -ic "phpenmod $*"
DOSKEY phpdismod=bash -ic "phpdismod $*"
DOSKEY composer=bash -ic "composer $*"
DOSKEY git=bash -ic "git $*"