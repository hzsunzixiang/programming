
CXX = gcc
CXXFLAGS +=-g -Wall -Wextra
TARGETS = itob_test
TARGETS_C_FILE = $(TARGETS).c
CLEANUP = rm -f $(TARGETS) *.o
all: $(TARGETS)
clean:
	$(CLEANUP)
$(TARGETS): $(TARGETS_C_FILE)
	$(CXX) $(CXXFLAGS)  $^ -o $@  
