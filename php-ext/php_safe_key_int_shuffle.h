/* safe_key_int_shuffle extension for PHP */

#ifndef PHP_SAFE_KEY_INT_SHUFFLE_H
# define PHP_SAFE_KEY_INT_SHUFFLE_H

extern zend_module_entry safe_key_int_shuffle_module_entry;
# define phpext_safe_key_int_shuffle_ptr &safe_key_int_shuffle_module_entry

# define PHP_SAFE_KEY_INT_SHUFFLE_VERSION "0.1.0"

# if defined(ZTS) && defined(COMPILE_DL_SAFE_KEY_INT_SHUFFLE)
ZEND_TSRMLS_CACHE_EXTERN()
# endif

#endif	/* PHP_SAFE_KEY_INT_SHUFFLE_H */
