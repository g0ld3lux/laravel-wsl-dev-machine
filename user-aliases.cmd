
;= @echo off
;= rem Call DOSKEY and use this file as the macrofile
;= %SystemRoot%\system32\doskey /listsize=1000 /macrofile=%0%
;= rem In batch mode, jump to the end of the file
;= goto:eof
;= Add aliases below here
e.=explorer .

unalias=alias /d $1
realias=alias /reload
sshkey=cat ~/.ssh/id_rsa.pub | echo 'SSH KEY Copied to clipboard.'


;= rem Laravel Shortcut
appname=bash -c "php artisan app:name"
artisan=bash -c "php artisan $*"
dump=bash -c "php artisan dump"
migrate=bash -c "php artisan migrate $*"
optimize=bash -c "php artisan optimize $*"
serve=bash -c "php artisan serve $*"
seed=bash -c "php artisan db:seed $*"
tinker=bash -c "php artisan tinker"
keygen=bash -c "php artisan key:generate"

;= rem Laravel Test Shortcut
t=bash -c "vendor/bin/phpunit"
b=bash -c "vendor/bind/behat"
b:api=bash -c "vendor/bin/behat -dl"
b:init=bash -c "vendor/bin/behat --init"
b:snip=bash -c "vendor/bin/behat --append-snippets"

;= rem Laravel Clear Cache Commands
c1=bash -c "php artisan cache:clear"
c2=bash -c "php artisan view:clear"
c3=bash -c "php artisan route:clear"
c4=bash -c "php artisan config:clear"

;= rem Laravel Make Commands
mauth=bash -c "php artisan make:auth $*"
mcmd=bash -c "php artisan make:command $*"
mctrl=bash -c "php artisan make:controller $*"
mevent=bash -c "php artisan make:event $*"
mjob=bash -c "php artisan make:job $*"
mlis=bash -c "php artisan make:listener $*"
mmail=bash -c "php artisan make:mail $*"
mmid=bash -c "php artisan make:middleware $*"
mmig=bash -c "php artisan make:migration $*"
mmod=bash -c "php artisan make:model $*"
mnot=bash -c "php artisan make:notification $*"
mpol=bash -c "php artisan make:policy $*"
mpro=bash -c "php artisan make:provider $*"
mreq=bash -c "php artisan make:request $*"
mseed=bash -c "php artisan make:seeder $*"
mtest=bash -c "php artisan make:test $*"

;= rem Laravel IDE Helper /PHPSTORM
model_helper=bash -c "php artisan ide-helper:models $*"
meta_helper=bash -c "php artisan ide-helper:meta $*"
ci_helper=bash -c "composer require --dev barryvdh/laravel-ide-helper"

;= rem Laravel Migrations
mi="bash -c php artisan migrate:install 
mr=bash -c "php artisan migrate:refresh $*"
mrb=bash -c "php artisan migrate:rollback $*"
ms=bash -c "php artisan migrate:status $*"

;= rem Laravel Routes
rc=bash -c "php artisan route:cache"
rl=bash -c "php artisan route:list"
rf=bash -c "php artisan route:list | grep $*"

;= rem Other Laravel Command Shortcut
cc=bash -c "php artisan config:cache $*"
eg=bash -c "php artisan event:generate $*"
sl=bash -c "php artisan storage:link $*"
sr=bash -c "php artisan schedule:run $*"
vp=bash -c "php artisan vendor:publish $*"

;= rem LaraDock
ldock:i=bash -c "git submodule add https://github.com/LaraDock/laradock.git"
nginx:i=bash -ic cp laradock/nginx/sites/sample.conf.example laradock/nginx/${1%%/}.conf
nginx:o=code-insiders laradocks/nginx/sites/${1%%/}.conf
ldock:compose=code-insiders laradock/docker-compose.yml
up=docker-compose up $*
down=docker-compose down

