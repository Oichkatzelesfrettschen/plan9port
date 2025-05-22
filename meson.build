project('plan9port', 'c', default_options: ['c_std=c23'])
cc = meson.get_compiler('c')
if cc.get_id() != 'clang'
  warning('This project expects clang for best compatibility')
endif
add_project_arguments('-Iinclude', language: 'c')
subdir('src/lib9')
subdir('src/cmd')
