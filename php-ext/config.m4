dnl config.m4 for extension safe_key_int_shuffle

dnl Comments in this file start with the string 'dnl'.
dnl Remove where necessary.

dnl If your extension references something external, use 'with':

dnl PHP_ARG_WITH([safe_key_int_shuffle],
dnl   [for safe_key_int_shuffle support],
dnl   [AS_HELP_STRING([--with-safe_key_int_shuffle],
dnl     [Include safe_key_int_shuffle support])])

dnl Otherwise use 'enable':

PHP_ARG_ENABLE([safe_key_int_shuffle],
  [whether to enable safe_key_int_shuffle support],
  [AS_HELP_STRING([--enable-safe_key_int_shuffle],
    [Enable safe_key_int_shuffle support])],
  [no])

if test "$PHP_SAFE_KEY_INT_SHUFFLE" != "no"; then
  dnl Write more examples of tests here...

  dnl Remove this code block if the library does not support pkg-config.
  dnl PKG_CHECK_MODULES([LIBFOO], [foo])
  dnl PHP_EVAL_INCLINE($LIBFOO_CFLAGS)
  dnl PHP_EVAL_LIBLINE($LIBFOO_LIBS, SAFE_KEY_INT_SHUFFLE_SHARED_LIBADD)

  dnl If you need to check for a particular library version using PKG_CHECK_MODULES,
  dnl you can use comparison operators. For example:
  dnl PKG_CHECK_MODULES([LIBFOO], [foo >= 1.2.3])
  dnl PKG_CHECK_MODULES([LIBFOO], [foo < 3.4])
  dnl PKG_CHECK_MODULES([LIBFOO], [foo = 1.2.3])

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-safe_key_int_shuffle -> check with-path
  dnl SEARCH_PATH="/usr/local /usr"     # you might want to change this
  dnl SEARCH_FOR="/include/safe_key_int_shuffle.h"  # you most likely want to change this
  dnl if test -r $PHP_SAFE_KEY_INT_SHUFFLE/$SEARCH_FOR; then # path given as parameter
  dnl   SAFE_KEY_INT_SHUFFLE_DIR=$PHP_SAFE_KEY_INT_SHUFFLE
  dnl else # search default path list
  dnl   AC_MSG_CHECKING([for safe_key_int_shuffle files in default path])
  dnl   for i in $SEARCH_PATH ; do
  dnl     if test -r $i/$SEARCH_FOR; then
  dnl       SAFE_KEY_INT_SHUFFLE_DIR=$i
  dnl       AC_MSG_RESULT(found in $i)
  dnl     fi
  dnl   done
  dnl fi
  dnl
  dnl if test -z "$SAFE_KEY_INT_SHUFFLE_DIR"; then
  dnl   AC_MSG_RESULT([not found])
  dnl   AC_MSG_ERROR([Please reinstall the safe_key_int_shuffle distribution])
  dnl fi

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-safe_key_int_shuffle -> add include path
  dnl PHP_ADD_INCLUDE($SAFE_KEY_INT_SHUFFLE_DIR/include)

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-safe_key_int_shuffle -> check for lib and symbol presence
  dnl LIBNAME=SAFE_KEY_INT_SHUFFLE # you may want to change this
  dnl LIBSYMBOL=SAFE_KEY_INT_SHUFFLE # you most likely want to change this

  dnl If you need to check for a particular library function (e.g. a conditional
  dnl or version-dependent feature) and you are using pkg-config:
  dnl PHP_CHECK_LIBRARY($LIBNAME, $LIBSYMBOL,
  dnl [
  dnl   AC_DEFINE(HAVE_SAFE_KEY_INT_SHUFFLE_FEATURE, 1, [ ])
  dnl ],[
  dnl   AC_MSG_ERROR([FEATURE not supported by your safe_key_int_shuffle library.])
  dnl ], [
  dnl   $LIBFOO_LIBS
  dnl ])

  dnl If you need to check for a particular library function (e.g. a conditional
  dnl or version-dependent feature) and you are not using pkg-config:
  dnl PHP_CHECK_LIBRARY($LIBNAME, $LIBSYMBOL,
  dnl [
  dnl   PHP_ADD_LIBRARY_WITH_PATH($LIBNAME, $SAFE_KEY_INT_SHUFFLE_DIR/$PHP_LIBDIR, SAFE_KEY_INT_SHUFFLE_SHARED_LIBADD)
  dnl   AC_DEFINE(HAVE_SAFE_KEY_INT_SHUFFLE_FEATURE, 1, [ ])
  dnl ],[
  dnl   AC_MSG_ERROR([FEATURE not supported by your safe_key_int_shuffle library.])
  dnl ],[
  dnl   -L$SAFE_KEY_INT_SHUFFLE_DIR/$PHP_LIBDIR -lm
  dnl ])
  dnl
  dnl PHP_SUBST(SAFE_KEY_INT_SHUFFLE_SHARED_LIBADD)

  dnl In case of no dependencies
  AC_DEFINE(HAVE_SAFE_KEY_INT_SHUFFLE, 1, [ Have safe_key_int_shuffle support ])

  PHP_NEW_EXTENSION(safe_key_int_shuffle, safe_key_int_shuffle.c, $ext_shared)
fi
