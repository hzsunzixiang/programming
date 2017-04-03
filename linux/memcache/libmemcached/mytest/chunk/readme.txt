

注意这个参数
STAT 1:total_pages 7


root@debian:~/programming/linux/memcache/libmemcached/mytest/chunk# echo "stats slabs"  |nc 127.0.0.1 11211 -q1
STAT 1:chunk_size 96
STAT 1:chunks_per_page 10922
STAT 1:total_pages 7
STAT 1:total_chunks 76454
STAT 1:used_chunks 72764
STAT 1:free_chunks 3690
STAT 1:free_chunks_end 0
STAT 1:mem_requested 6732612
STAT 1:get_hits 0
STAT 1:cmd_set 129452
STAT 1:delete_hits 0
STAT 1:incr_hits 0
STAT 1:decr_hits 0
STAT 1:cas_hits 0
STAT 1:cas_badval 0
STAT 1:touch_hits 0
STAT active_slabs 1
STAT total_malloced 7339584
END

