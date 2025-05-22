# Minimal subset of lib9 built with clang and C23
lib9_sources = [
    '_exits.c', '_p9dialparse.c', '_p9dir.c', 'announce.c', 'argv0.c', 'atexit.c',
    'atnotify.c', 'atoi.c', 'atol.c', 'atoll.c', 'await.c', 'cistrcmp.c',
    'cistrncmp.c', 'cistrstr.c', 'cleanname.c', 'convD2M.c', 'convM2D.c',
    'convM2S.c', 'convS2M.c', 'crypt.c', 'ctime.c', 'debugmalloc.c', 'dial.c',
    'dirfstat.c', 'dirfwstat.c', 'dirmodefmt.c', 'dirstat.c', 'dirwstat.c',
    'dup.c', 'encodefmt.c', 'errstr.c', 'exec.c', 'execl.c', 'exitcode.c',
    'fcallfmt.c', 'fmtlock2.c', 'frand.c', 'frexp.c', 'getcallerpc.c',
    'getenv.c', 'getfields.c', 'getnetconn.c', 'getns.c', 'getuser.c',
    'getwd.c', 'jmp.c', 'lnrand.c', 'lock.c', 'lrand.c', 'main.c', 'malloc.c',
    'malloctag.c', 'mallocz.c', 'nan.c', 'needsrcquote.c', 'needstack.c',
    'netcrypt.c', 'netmkaddr.c', 'notify.c', 'nrand.c', 'nulldir.c', 'open.c',
    'opentemp.c', 'pin.c', 'pipe.c', 'post9p.c', 'postnote.c', 'qlock.c',
    'quote.c', 'rand.c', 'read9pmsg.c', 'readcons.c', 'readn.c', 'rfork.c',
    'searchpath.c', 'sendfd.c', 'sleep.c', 'strdup.c', 'strecpy.c',
    'sysfatal.c', 'syslog.c', 'sysname.c', 'test.c', 'testfltfmt.c',
    'testfmt.c', 'testprint.c', 'time.c', 'tm2sec.c', 'tokenize.c', 'truerand.c',
    'u16.c', 'u32.c', 'u64.c', 'unsharp.c', 'wait.c', 'waitpid.c', 'write.c',
    'zoneinfo.c',
]
lib9_fmt = files(
    'fmt/charstod.c','fmt/dofmt.c','fmt/dorfmt.c','fmt/errfmt.c','fmt/fltfmt.c',
    'fmt/fmt.c','fmt/fmtfd.c','fmt/fmtfdflush.c','fmt/fmtlocale.c','fmt/fmtlock.c',
    'fmt/fmtnull.c','fmt/fmtprint.c','fmt/fmtquote.c','fmt/fmtrune.c','fmt/fmtstr.c',
    'fmt/fmtvprint.c','fmt/fprint.c','fmt/nan64.c','fmt/pow10.c','fmt/print.c',
    'fmt/runefmtstr.c','fmt/runeseprint.c','fmt/runesmprint.c','fmt/runesnprint.c',
    'fmt/runesprint.c','fmt/runevseprint.c','fmt/runevsmprint.c','fmt/runevsnprint.c',
    'fmt/seprint.c','fmt/smprint.c','fmt/snprint.c','fmt/sprint.c','fmt/strtod.c',
    'fmt/test.c','fmt/test2.c','fmt/test3.c','fmt/vfprint.c','fmt/vseprint.c',
    'fmt/vsmprint.c','fmt/vsnprint.c'
)
lib9_utf = files(
    'utf/rune.c','utf/runestrcat.c','utf/runestrchr.c','utf/runestrcmp.c',
    'utf/runestrcpy.c','utf/runestrdup.c','utf/runestrecpy.c','utf/runestrlen.c',
    'utf/runestrncat.c','utf/runestrncmp.c','utf/runestrncpy.c','utf/runestrrchr.c',
    'utf/runestrstr.c','utf/runetype.c','utf/utfecpy.c','utf/utflen.c',
    'utf/utfnlen.c','utf/utfrrune.c','utf/utfrune.c','utf/utfutf.c'
)
lib9 = static_library('9', lib9_sources + lib9_fmt + lib9_utf,
    include_directories: include_directories('.', 'fmt', 'utf', '../../include'))

meson.override_dependency('lib9', declare_dependency(link_with: lib9,
    include_directories: include_directories('.', 'fmt', 'utf', '../../include')))
*** End File
