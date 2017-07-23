SRC_DIR=.
DST_DIR=main

#PROTOC=../protobuf/src/protoc
PROTOC=protoc
$PROTOC -I=$SRC_DIR --cpp_out=$DST_DIR $SRC_DIR/addressbook.proto
