ASM = nasm

SRC_DIR = src
BUILD_DIR = build

# Rule to create the floppy disk image
$(BUILD_DIR)/main.img: $(BUILD_DIR)/main.bin
	mkdir -p $(BUILD_DIR)                # Ensure the build directory exists
	cp $(BUILD_DIR)/main.bin $(BUILD_DIR)/main.img
	truncate -s 1440k $(BUILD_DIR)/main.img

# Rule to compile the assembly file into a binary
$(BUILD_DIR)/main.bin: $(SRC_DIR)/main.asm
	mkdir -p $(BUILD_DIR)                # Ensure the build directory exists
	$(ASM) $(SRC_DIR)/main.asm -f bin -o $(BUILD_DIR)/main.bin

