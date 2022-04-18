all: hello_world

BUILD_DIR := "./build"

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

hello_world.o: hello_world.asm
	yasm -f macho64 -o build/hello_world.o hello_world.asm

hello_world: hello_world.o
	ld build/hello_world.o -o build/hello_world -macosx_version_min 11.0 -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem
