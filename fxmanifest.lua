fx_version 'bodacious'
game 'gta5'

description 'Bottle system by HUEHUE'
author 'HUEHUE'
version '1.0.0'

shared_scripts {
    'config.lua',
}

client_scripts {	
	'client/*.lua',
}

server_scripts {	
	'@mysql-async/lib/MySQL.lua',
	'server/*.lua',
}
