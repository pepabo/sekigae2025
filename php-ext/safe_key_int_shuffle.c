/* safe_key_int_shuffle extension for PHP */

#ifdef HAVE_CONFIG_H
# include "config.h"
#endif

#include "php.h"
#include "ext/standard/info.h"
#include "ext/standard/php_random.h"
#include "php_safe_key_int_shuffle.h"
#include "safe_key_int_shuffle_arginfo.h"

/* For compatibility with older PHP versions */
#ifndef ZEND_PARSE_PARAMETERS_NONE
#define ZEND_PARSE_PARAMETERS_NONE() \
	ZEND_PARSE_PARAMETERS_START(0, 0) \
	ZEND_PARSE_PARAMETERS_END()
#endif
#define SWAP_BUCKET_VALUES(current_bucket, target_bucket) \
{ \
	zval tmp = (current_bucket).val; \
	(current_bucket).val = (target_bucket).val; \
	(target_bucket).val = tmp; \
}
/* {{{ void _safe_key_int_shuffle(array &$array) */
PHP_FUNCTION(safe_key_int_shuffle)
{
	zval *array;
	ZEND_PARSE_PARAMETERS_START(1, 1)
		Z_PARAM_ARRAY_EX(array, 0, 1)
	ZEND_PARSE_PARAMETERS_END_EX(RETURN_FALSE);

	HashTable *ht = Z_ARRVAL_P(array);
	uint32_t n = zend_hash_num_elements(ht);

	if (n < 2) RETURN_TRUE;

	Bucket *buckets = ht->arData;
	for (uint32_t i = n - 1; i > 0; i--) {
		zend_long rand_i;
		php_random_int(0, i, &rand_i, 1);
		SWAP_BUCKET_VALUES(buckets[i], buckets[rand_i]);
		zend_hash_iterators_update(ht, rand_i, i);
	}

	RETURN_TRUE;
}
/* }}} */

/* {{{ PHP_RINIT_FUNCTION */
PHP_RINIT_FUNCTION(safe_key_int_shuffle)
{
#if defined(ZTS) && defined(COMPILE_DL_SAFE_KEY_INT_SHUFFLE)
	ZEND_TSRMLS_CACHE_UPDATE();
#endif

	return SUCCESS;
}
/* }}} */

/* {{{ PHP_MINFO_FUNCTION */
PHP_MINFO_FUNCTION(safe_key_int_shuffle)
{
	php_info_print_table_start();
	php_info_print_table_header(2, "safe_key_int_shuffle support", "enabled");
	php_info_print_table_end();
}
/* }}} */

/* {{{ safe_key_int_shuffle_module_entry */
zend_module_entry safe_key_int_shuffle_module_entry = {
	STANDARD_MODULE_HEADER,
	"safe_key_int_shuffle",					/* Extension name */
	ext_functions,					/* zend_function_entry */
	NULL,							/* PHP_MINIT - Module initialization */
	NULL,							/* PHP_MSHUTDOWN - Module shutdown */
	PHP_RINIT(safe_key_int_shuffle),			/* PHP_RINIT - Request initialization */
	NULL,							/* PHP_RSHUTDOWN - Request shutdown */
	PHP_MINFO(safe_key_int_shuffle),			/* PHP_MINFO - Module info */
	PHP_SAFE_KEY_INT_SHUFFLE_VERSION,		/* Version */
	STANDARD_MODULE_PROPERTIES
};
/* }}} */

#ifdef COMPILE_DL_SAFE_KEY_INT_SHUFFLE
# ifdef ZTS
ZEND_TSRMLS_CACHE_DEFINE()
# endif
ZEND_GET_MODULE(safe_key_int_shuffle)
#endif
