FROM ubuntu

# Install cowsay, fortune-mod, and netcat packages
RUN apt-get update \
    && apt-get install -y cowsay fortune-mod netcat \
    && rm -rf /var/lib/apt/lists/*

# Add /usr/games to the PATH environment variable
ENV PATH="/usr/games:${PATH}"

# Copy the script into the container
COPY wisecow.sh /wisecow.sh

# Ensure the script has executable permissions
RUN chmod +x /wisecow.sh

# Define the default command to run the script
CMD ["/wisecow.sh"]
