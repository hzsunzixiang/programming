begin:    22    34     3    32    82    55    89    50    37     5    64    35     9    70	end:

xxpivot:70, left:0, right:12, end:13
--pivot:70, left:11, right:11, end:13
begin:    22    34     3    32     9    55    35    50    37     5    64    89    82    70	end:
begin:    22    34     3    32     9    55    35    50    37     5    64    70    82    89	end:

xxpivot:64, left:0, right:9, end:10
++pivot:64, left:9, right:9, end:10
begin:    22    34     3    32     9    55    35    50    37     5    64	end:
++pivot:64, left:10, right:9

xxpivot:5, left:0, right:8, end:9
--pivot:5, left:1, right:1, end:9
begin:     3    34    22    32     9    55    35    50    37     5	end:
begin:     3     5    22    32     9    55    35    50    37    34	end:

xxpivot:34, left:2, right:8, end:9
--pivot:34, left:5, right:5, end:9
begin:     3     5    22    32     9    55    35    50    37    34	end:
begin:     3     5    22    32     9    34    35    50    37    55	end:

xxpivot:9, left:2, right:3, end:4
--pivot:9, left:2, right:2, end:4
begin:     3     5    22    32     9	end:
begin:     3     5     9    32    22	end:

xxpivot:22, left:3, right:3, end:4
--pivot:22, left:3, right:3, end:4
begin:     3     5     9    32    22	end:
begin:     3     5     9    22    32	end:

xxpivot:55, left:6, right:8, end:9
++pivot:55, left:8, right:8, end:9
begin:     3     5     9    22    32    34    35    50    37    55	end:
++pivot:55, left:9, right:8

xxpivot:37, left:6, right:7, end:8
--pivot:37, left:7, right:7, end:8
begin:     3     5     9    22    32    34    35    50    37	end:
begin:     3     5     9    22    32    34    35    37    50	end:

xxpivot:89, left:12, right:12, end:13
++pivot:89, left:12, right:12, end:13
begin:     3     5     9    22    32    34    35    37    50    55    64    70    82    89	end:
++pivot:89, left:13, right:12


begin:     3     5     9    22    32    34    35    37    50    55    64    70    82    89	end:
