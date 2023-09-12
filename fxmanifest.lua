fx_version 'cerulean'
game 'gta5'

lua54 'yes'

description 'Weather Syncing for ox_core'
version '0.0.1'

dependencies {
	"/onesync",
	"ox_core",
	"ox_lib"
}

shared_scripts {
	'@ox_lib/init.lua',
}

client_scripts {
	'@ox_core/imports/client.lua',
	'client.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'@ox_core/imports/server.lua',
	'config.lua',
	'server.lua'
}

-- files {
-- 	'config.json'
-- }

exports {
	'toggleSync'
}
