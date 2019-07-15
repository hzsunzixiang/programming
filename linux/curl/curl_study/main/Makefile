
COMOPT = -g -c -Wall -fPIC
#CFLAGS = -O3 -Wall -g -DNEED_XSS -DNEED_FILTER -fPIC
CFLAGS = -O0 -Wall -g -DNEED_XSS -DNEED_FILTER -fPIC

SUBDIR=..
INCLUDE = -I$(SUBDIR)/comm


LIB = -lcurl -lssl -lcrypto

all: curl_test

	
curl_test: curl_test.o ../comm/common.o ../comm/base64.o ../comm/urlcodec.o  ../comm/curl_api.o
	$(CXX) $(CFLAGS) -o $@ $^ $(LIB)



clean:
	rm -f *.o ../comm/*.o  curl_test

%.o: %.cpp
	$(CXX) $(CFLAGS) $(COMOPT) $(INCLUDE)  $(DEF) $< -o $@


