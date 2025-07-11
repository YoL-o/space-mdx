FROM node:lts

# Install system packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    git ffmpeg imagemagick webp && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Clone the repo
RUN git clone https://github.com/Dark-Xploit/SPACE-MD.git /app

WORKDIR /app

# Install Node dependencies
RUN npm install && npm cache clean --force

# Copy the keepalive script you created
COPY keepalive.js .

# Expose port
EXPOSE 3000

# Start with keepalive
CMD ["node", "keepalive.js"]
