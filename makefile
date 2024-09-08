# Compiler
CC = gcc

# Compiler flags
CFLAGS = -Wall -Wextra -std=c11

# Find all .c files in the current directory
SRC = $(wildcard *.c)

# Create a list of object files based on the .c files
OBJ = $(SRC:.c=.o)

# The name of the output executable
EXEC = program

# Default target: compile the executable
all: $(EXEC)

# Link the object files to create the executable, then delete the object files
$(EXEC): $(OBJ)
	@$(CC) $(OBJ) -o $(EXEC)
	@rm -f $(OBJ)  # Delete .o files after linking
	@rm -rf program

# Compile each .c file into a .o file
%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@

# Clean up the executable
clean:
	@rm -f $(EXEC)
