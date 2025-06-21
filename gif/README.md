# Terminalizer Recording Guide

This directory contains GIF recordings created with [Terminalizer](https://github.com/faressoft/terminalizer), a tool for recording terminal sessions and converting them to animated GIFs.

## What is Terminalizer?

Terminalizer is a command-line tool that records your terminal sessions and converts them into animated GIFs. It's perfect for creating tutorials, demonstrations, or showcasing command-line workflows.

## Installation

### Local Installation (Recommended for this project)

This project includes terminalizer as a local dependency. You can use it directly:

```bash
# Use the local terminalizer installation
terminalizer record my-session
```

### Local npm Installation

You can install terminalizer locally in your project directory:

```bash
# Install terminalizer locally (without -g flag)
npm install terminalizer

# Then use it with the full path
./node_modules/terminalizer/bin/app.js record my-session

# Or add a script to package.json for easier access
```

### Global Installation

#### Fedora Linux

```bash
# Install Node.js and npm (if not already installed)
sudo dnf install nodejs npm

# Install Terminalizer globally
sudo npm install -g terminalizer
```

#### Arch Linux

```bash
# Install from AUR (recommended)
yay -S terminalizer

# Or install manually with npm
sudo npm install -g terminalizer
```

#### Alternative: Manual Installation

If the package manager installation doesn't work, you can install it manually:

```bash
# Install Node.js first (if not already installed)
# Then install Terminalizer
sudo npm install -g terminalizer
```

## Recording Your Terminal Session

### Basic Recording

1. **Start a recording session:**
   ```bash
   # Using local installation
   terminalizer record my-session
   
   # Or using global installation
   terminalizer record my-session
   ```

2. **Perform your terminal commands** - everything you type and see will be recorded

3. **Stop the recording:**
   ```bash
   # Press Ctrl+D or type 'exit' to stop recording
   ```

### Using Custom Configuration

This project includes a custom `config.yml` file optimized for codelife recordings:

```bash
# Record using the local custom configuration
terminalizer record --config config.yml my-session

# Or with global installation
terminalizer record --config config.yml my-session
```

### Using the Original codelife Configuration

The `codelife-terminalizer.yml` file in the root directory contains the original configuration:

```bash
# Record using the original configuration
terminalizer record --config codelife-terminalizer.yml my-session

# Or with global installation
terminalizer record --config codelife-terminalizer.yml my-session
```

## Rendering GIFs

### Basic Rendering

```bash
# Render the recorded session to GIF
terminalizer render my-session

# Or with global installation
terminalizer render my-session
```

### Using Custom Configuration

```bash
# Render using the local custom configuration
terminalizer render --config config.yml my-session

# Or with global installation
terminalizer render --config config.yml my-session
```

### Advanced Rendering Options

```bash
# Render with custom output name
terminalizer render my-session -o my-custom-name.gif

# Render with specific quality (1-100)
terminalizer render my-session --quality 90

# Render with custom frame delay (in milliseconds)
terminalizer render my-session --frameDelay 800
```

## Configuration Files

### config.yml (Recommended for new recordings)

The `config.yml` file in the project root is optimized for new codelife recordings with:

- **Terminal Size**: 100x34 columns/rows for optimal viewing
- **Font**: Courier Prime for better readability
- **Frame Settings**: Clean appearance without borders
- **Custom Cursor**: Block-style cursor for better visibility
- **Color Theme**: Matches the codelife terminal theme

### Color Theme
Both configurations use a custom color scheme that matches the terminal theme used in the codelife project:

```yaml
theme:
  background: "#000000"
  foreground: "#EEE8D5"
  cursor: "#c7c7c7"
  # ... other color definitions
```

**Why Custom Colors?**
Terminalizer might use different default colors than your terminal theme. The custom configuration ensures that the recorded GIF matches the exact colors and appearance of the original terminal session.

## Best Practices for Recording

### 1. Prepare Your Environment
- Set your terminal to the desired size (100x34 recommended)
- Use the same color theme as defined in the configuration
- Clear your terminal before starting: `clear`

### 2. Recording Tips
- Speak slowly and type deliberately
- Pause between commands to allow viewers to read
- Use clear, descriptive commands
- Avoid long idle periods (maxIdleTime is set to 2000ms)

### 3. Post-Processing
- Review your recording before rendering
- Consider trimming unnecessary parts
- Test the final GIF on different platforms

## Troubleshooting

### Common Issues

1. **Colors don't match:**
   - Use the custom configuration file (`config.yml`)
   - Ensure your terminal theme matches the configuration

2. **Recording quality issues:**
   - Check your terminal size matches the configuration
   - Ensure sufficient disk space for recording

3. **Rendering fails:**
   - Verify Node.js and npm are properly installed
   - Check file permissions in the recording directory

4. **Configuration errors:**
   - Make sure you're using the correct configuration file path
   - Verify the YAML syntax is correct

### Getting Help

- [Terminalizer GitHub Repository](https://github.com/faressoft/terminalizer)
- [Terminalizer Documentation](https://terminalizer.com/)
- Check the terminalizer logs for detailed error messages

## Example Workflow

Here's a complete example of recording a codelife session:

```bash
# 1. Navigate to the codelife directory
cd /path/to/codelife

# 2. Start recording with local custom config
terminalizer record --config config.yml codelife-demo

# 3. Run the codelife script
./isca-cv.sh

# 4. Navigate through the pages (1, 2, 3, 4, 5)
# 5. Exit with 'x'

# 6. Stop recording (Ctrl+D or exit)

# 7. Render the GIF
terminalizer render codelife-demo

# 8. The GIF will be saved in the current directory
```

## Files in This Directory

- `isca-cv.gif` - Original codelife demonstration recording
- `codelive-06-25.gif` - Additional demonstration recording
- `README.md` - This documentation file

The recordings showcase the codelife terminal-based CV application with proper color rendering and smooth animations. 