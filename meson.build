project('plan9port', 'c', default_options: ['c_std=c23'])
cc = meson.get_compiler('c')
objtype = meson.get_external_property('OBJTYPE', '')
if objtype == 'ia16'
  message('Configuring for ia16 target')
elif cc.get_id() != 'clang'
  warning('This project expects clang for best compatibility')
endif
add_project_arguments('-Iinclude', language: 'c')
subdir('src/lib9')
subdir('src/cmd')
