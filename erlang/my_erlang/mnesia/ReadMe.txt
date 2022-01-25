https://www.erlang.org/doc/man/mnesia.html#create_table-2




{attributes, AtomList} is a list of the attribute names for the records that are supposed to populate the table. Default is [key, val]. The table must at least have one extra attribute in addition to the key.

When accessing single attributes in a record, it is not necessary, or even recommended, to hard code any attribute names as atoms. Use construct record_info(fields, RecordName) instead. It can be used for records of type RecordName.


{type, Type}, where Type must be either of the atoms set, ordered_set, or bag. Default is set. In a set, all records have unique keys. In a bag, several records can have the same key, but the record content is unique. If a non-unique record is stored, the old conflicting records are overwritten.

Notice that currently ordered_set is not supported for disc_only_copies.
