#!/bin/bash

# Function to build a single book
build_book() {
    local book_dir=$1
    if [ -f "${book_dir}/book.toml" ]; then
        echo "Building ${book_dir}..."
        (cd "${book_dir}" && mdbook build)

    fi
}

# Build individual books
for book in [0-9][0-9]_book*/; do
    build_book "$book"
done

# Build master book if it exists
if [ -d "master" ]; then
    echo "Building master book..."
    build_book "master"
fi

echo "Build complete!"
