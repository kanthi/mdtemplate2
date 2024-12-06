# Basic Navigation Commands

The foundation of working in Linux is understanding how to navigate the file system. Here are the essential commands you'll use daily.

## pwd (Print Working Directory)

The `pwd` command shows your current location in the file system.

```bash
pwd
# Output example: /home/username/documents
```

### Options
- `-P`: Show the physical path (resolves symbolic links)
- `-L`: Show the logical path (default)

## ls (List Directory Contents)

The `ls` command lists files and directories.

```bash
# Basic usage
ls

# Show all files (including hidden)
ls -a

# Long format with details
ls -l

# Human-readable file sizes
ls -lh
```

### Common Options
- `-a`: Show all files (including hidden)
- `-l`: Long format
- `-h`: Human-readable sizes
- `-R`: Recursive listing
- `-t`: Sort by modification time

## cd (Change Directory)

The `cd` command changes your current directory.

```bash
# Go to home directory
cd

# Go up one directory
cd ..

# Go to specific directory
cd /path/to/directory

# Go to previous directory
cd -
```

### Special Directories
- `.`: Current directory
- `..`: Parent directory
- `~`: Home directory
- `-`: Previous directory

## Best Practices

1. Use tab completion to:
   - Prevent typing errors
   - Save time
   - Verify path existence

2. Use relative paths when:
   - Working in nearby directories
   - Writing scripts that might run on different systems

3. Use absolute paths when:
   - Writing system services
   - Creating cron jobs
   - Working with automation tools

## Common Mistakes to Avoid

1. Forgetting your current location
2. Not using tab completion
3. Using absolute paths when relative would be simpler
4. Not checking for hidden files
5. Forgetting about file permissions

## Practice Exercises

1. Navigate through your file system:
   ```bash
   cd ~
   pwd
   ls -la
   cd /etc
   pwd
   ```

2. Use different ls options:
   ```bash
   ls -lh
   ls -la
   ls -latr
   ```

3. Practice with relative and absolute paths:
   ```bash
   cd ~/Documents
   cd ../../usr/local
   cd -
   ```
