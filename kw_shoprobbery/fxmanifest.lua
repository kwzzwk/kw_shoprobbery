fx_version('cerulean')
games({ 'gta5' })
description 'KW_shoprobbery'

server_scripts{
  'server/sv_main.lua'
}

shared_script {
  '@ox_lib/init.lua',
  'config.lua',
}

client_script {
  'client/cl_main.lua',
}

lua54 'yes'