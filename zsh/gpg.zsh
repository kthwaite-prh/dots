# Ensure GPG_TTY is set to the current terminal
export GPG_TTY=$(tty)
# Check if gpg-agent is already running
if ! pgrep -u "$USER" gpg-agent > /dev/null 2>&1; then
    echo "Starting gpg-agent..."
    eval $(gpg-agent --daemon) > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo "Error: Failed to start gpg-agent." >&2
        exit 1
    fi
else
    # echo "gpg-agent is already running."
fi
