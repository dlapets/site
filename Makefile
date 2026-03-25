# Binary name
BINARY_NAME=server
# Go commands
GO=go
# Build directory
BUILD_DIR=bin

# Default target
.PHONY: all
all: build

# Build the binary
.PHONY: build
build:
	@echo "Building $(BINARY_NAME)..."
	@mkdir -p $(BUILD_DIR)
	$(GO) build -o $(BUILD_DIR)/$(BINARY_NAME) cmd/server/main.go
	@echo "Build complete: $(BUILD_DIR)/$(BINARY_NAME)"

# Run the binary locally
.PHONY: run
run: build
	@echo "Running $(BINARY_NAME)..."
	./$(BUILD_DIR)/$(BINARY_NAME)

# Run all tests in the entire project
.PHONY: test
test:
	@echo "Running tests..."
	$(GO) test -v ./...

# Run tests with coverage
.PHONY: test-coverage
test-coverage:
	@echo "Running tests with coverage..."
	$(GO) test -v -coverprofile=coverage.out ./...
	$(GO) tool cover -html=coverage.out -o coverage.html
	@echo "Coverage report generated: coverage.html"

# Clean build artifacts
.PHONY: clean
clean:
	@echo "Cleaning..."
	@rm -rf $(BUILD_DIR)
	@rm -f coverage.out coverage.html
	@echo "Clean complete"

# Download dependencies
.PHONY: deps
deps:
	@echo "Downloading dependencies..."
	$(GO) mod download
	$(GO) mod tidy

# Format code
.PHONY: fmt
fmt:
	@echo "Formatting code..."
	$(GO) fmt ./...

# Run linter (requires golangci-lint)
.PHONY: lint
lint:
	@echo "Running linter..."
	golangci-lint run

# Help target
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  make build         - Build the binary"
	@echo "  make run           - Build and run the binary locally"
	@echo "  make test          - Run all tests"
	@echo "  make test-coverage - Run tests with coverage report"
	@echo "  make clean         - Remove build artifacts"
	@echo "  make deps          - Download and tidy dependencies"
	@echo "  make fmt           - Format code"
	@echo "  make lint          - Run linter (requires golangci-lint)"
