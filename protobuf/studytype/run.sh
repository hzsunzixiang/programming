SRC_DIR=.
DST_DIR=main

PROTOC=../protobuf/src/protoc
#PROTOC=protoc
$PROTOC -I=$SRC_DIR --cpp_out=$DST_DIR $SRC_DIR/msgtype.proto
$PROTOC -I=$SRC_DIR --cpp_out=$DST_DIR $SRC_DIR/enumtype.proto
$PROTOC -I=$SRC_DIR --cpp_out=$DST_DIR $SRC_DIR/nestedtype.proto
