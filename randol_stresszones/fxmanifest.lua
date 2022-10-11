fx_version 'cerulean'
game 'gta5'

author 'Randolio'
description 'Stress Zones'

shared_scripts {
	'config.lua'
}

client_scripts {
	'cl_stress.lua',
	'@PolyZone/client.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/ComboZone.lua',
}

lua54 'yes'