# Basic Navigation Commands

This section covers the most fundamental Linux commands for navigating the file system.

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

## Tips and Tricks

1. Tab Completion
   - Press Tab to auto-complete paths
   - Double Tab shows all possible completions

2. Directory Stack
   ```bash
   # Push current directory to stack
   pushd /path/to/dir
   
   # Pop directory from stack
   popd
   ```

3. Quick Home Directory Navigation
   ```bash
   # Go to Downloads in home directory
   cd ~/Downloads
   ```

## Common Mistakes to Avoid

1. Using absolute paths when relative paths would be simpler
2. Forgetting about hidden files when using `ls`
3. Not using tab completion, leading to typing errors

## Practice Exercises

1. Try navigating between different directories using both absolute and relative paths
2. List files with different combinations of `ls` options
3. Use `pushd` and `popd` to manage a stack of directories
