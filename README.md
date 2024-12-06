# MDBook Template Project

This is a monolithic repository containing multiple MDBook projects that can be built individually or combined into a master book.

## Structure

```
├── 00_book1
│   ├── 00_topic1
│   │   └── 00_subtopic
│   └── 01_topic2
├── 01_book2
│   ├── 00_topic1
│   │   └── 00_subtopic
│   └── 01_topic2
├── 02_book3
├── 04_book4
└── 05_book5
```

## Requirements

- mdBook (Rust based documentation tool)
- mdbook-pdf (for PDF generation)
- mdbook-epub (for EPUB generation)

## Installation

```bash
cargo install mdbook
cargo install mdbook-pdf
cargo install mdbook-epub
```

## Building Books

### Individual Books
To build a specific book:
```bash
cd XX_bookN
mdbook build
```

### Master Book
To build the master book that combines all books:
```bash
mdbook build master
```

## Output Formats
Each book can be built in the following formats:
- HTML (default)
- PDF (using mdbook-pdf)
- EPUB (using mdbook-epub)

## GitHub Pages
The HTML output is configured to be deployed to GitHub Pages automatically through GitHub Actions.
