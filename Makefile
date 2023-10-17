#AddmusicK Makefile
#Please unzip src.zip first before using this makefile.
#For Mac and Linux, should work with a standard issue G++
#For Windows, you need MinGW_w64 to compile. Project files exist to compile
#this program under Visual Studio 2019 inside src.zip as an alternative
#method for compiling this program.
#NOTE: C++17 support is recommended to ensure your program compiles
#successfully!
#Use Visual Studio 2019 instead to compile AMKGUI (there is no Mac/Linux
#version at this time unless you're using Wine or some other emulation
#layer)

CXX = em++

CXXFLAGS = -Wall -pedantic -std=c++17 -Os
#Commented out for now
#with libboost (this specifically targets MacPorts inclusions)
#CXXFLAGS += -I/opt/local/include

LDFLAGS = -ldl \
	--pre-js ./_js_prefix.js \
	--post-js ./_js_suffix.js \
	--embed-file ./1DF9 \
	--embed-file ./1DFC \
	--embed-file ./asm \
	--embed-file ./music \
	--embed-file ./samples \
	--embed-file ./SPCs \
	--embed-file ./stats \
	--embed-file ./Visualizations \
	--embed-file "./Addmusic_list.txt" \
	--embed-file "./Addmusic_sample groups.txt" \
	--embed-file "./Addmusic_sound effects.txt" \
	-s TOTAL_MEMORY=268435456 \
	-s ENVIRONMENT=web \
	-s INVOKE_RUN=0 \
	-s EXIT_RUNTIME=0 \
	-s EXPORTED_FUNCTIONS="[_main, _malloc]" \
	-s EXPORTED_RUNTIME_METHODS="[FS, ccall, cwrap, setValue, writeAsciiToMemory]"

#Commented out for now
#with libboost (this specifically targets MacPorts inclusions)
#LDFLAGS += -L /opt/local/lib/ -lboost_system -lboost_filesystem

SRCS = src/AddmusicK/*.cpp src/AddmusicK/asardll.c src/AM405Remover/AddMusic.cpp

AM4SRCS = src/AM4Batch/*.cpp

AMMSRCS = src/AMMBatch/*.cpp

all: addmusick

addmusick: $(SRCS) src/AddmusicK/*.h; \
	cd src/AddmusicK; \
	$(CXX) $(CXXFLAGS) -c $(patsubst %,../../%,$(SRCS))
	$(CXX) -o AddmusicK.js src/AddmusicK/*.o $(LDFLAGS)
#	cd src/AM4Batch; \
#	$(CXX) $(CXXFLAGS) -c $(patsubst %,../../%,$(AM4SRCS))
#	$(CXX) -o AM4Batch.js src/AM4Batch/*.o $(LDFLAGS)
#	cd src/AMMBatch; \
#	$(CXX) $(CXXFLAGS) -c $(patsubst %,../../%,$(AMMSRCS))
#	$(CXX) -o AMMBatch.js src/AMMBatch/*.o $(LDFLAGS)

clean:
	rm -rf src/AddmusicK/*.o ./addmusick

.PHONY: all clean
