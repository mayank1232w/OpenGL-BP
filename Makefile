CXX      = g++
CC       = gcc
CXXFLAGS = -std=c++17 -Wall -Wextra -I./include
CFLAGS   = -Wall -Wextra -I./include

LDFLAGS  = -lglfw -lGL -ldl -lm
TARGET   = app

SRC_CPP  = src/main.cpp
SRC_C    = src/glad.c

OBJ_CPP  = $(SRC_CPP:.cpp=.o)
OBJ_C    = $(SRC_C:.c=.o)

all: $(TARGET)

$(TARGET): $(OBJ_CPP) $(OBJ_C)
	$(CXX) $^ $(LDFLAGS) -o $@

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ_CPP) $(OBJ_C) $(TARGET)

run: $(TARGET)
	./$(TARGET)

.PHONY: all clean run
