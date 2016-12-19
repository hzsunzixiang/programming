
MEMCACHED_DISTRIBUTION_MODULA 跟 MEMCACHED_DISTRIBUTION_CONSISTENT 差不多


- rate_modual.txt
	MEMCACHED_DISTRIBUTION_MODULA 
- rate_consistent.txt
	MEMCACHED_DISTRIBUTION_CONSISTENT
- rate_ketama_weight.txt
	MEMCACHED_BEHAVIOR_KETAMA_WEIGHTED  比较好
- rate_ketama_md5.txt
	MEMCACHED_BEHAVIOR_KETAMA 稍逊于 MEMCACHED_BEHAVIOR_KETAMA_WEIGHTED




libmemcached/behavior.c

从源码中可以看到


MEMCACHED_BEHAVIOR_KETAMA 和 MEMCACHED_BEHAVIOR_KETAMA_WEIGHTED 都是设置 MEMCACHED_DISTRIBUTION_CONSISTENT_KETAMA 

差别在于  ptr->flags.ketama_weighted= set_flag(data); 是否有设置

================================================================
case MEMCACHED_BEHAVIOR_KETAMA:
{
	if (data)
	{
		(void)memcached_behavior_set_key_hash(ptr, MEMCACHED_HASH_MD5);
		(void)memcached_behavior_set_distribution_hash(ptr, MEMCACHED_HASH_MD5);
		(void)memcached_behavior_set_distribution(ptr, MEMCACHED_DISTRIBUTION_CONSISTENT_KETAMA);
	}
	else
	{
		(void)memcached_behavior_set_key_hash(ptr, MEMCACHED_HASH_DEFAULT);
		(void)memcached_behavior_set_distribution_hash(ptr, MEMCACHED_HASH_DEFAULT);
		(void)memcached_behavior_set_distribution(ptr, MEMCACHED_DISTRIBUTION_MODULA);
	}

	break;
}
case MEMCACHED_BEHAVIOR_KETAMA_WEIGHTED:
{
	(void)memcached_behavior_set_key_hash(ptr, MEMCACHED_HASH_MD5);
	(void)memcached_behavior_set_distribution_hash(ptr, MEMCACHED_HASH_MD5);
	ptr->flags.ketama_weighted= set_flag(data);
	/**
	  @note We try to keep the same distribution going. This should be deprecated and rewritten.
	 */
	return memcached_behavior_set_distribution(ptr, MEMCACHED_DISTRIBUTION_CONSISTENT_KETAMA);
}

