fx_version 'cerulean'
game 'gta5'

lua54 'yes'

description 'Weather Syncing for OneSync'
version '0.0.2'

dependencies {
	"/onesync",
	"ox_lib"
}

shared_scripts {
	'@ox_lib/init.lua',
}

client_scripts {
	'client.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'config.lua',
	'server.lua'
}

-- files {
-- 	'config.json'
-- }

server_exports {
	'setSync'
}
