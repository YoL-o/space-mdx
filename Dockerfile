FROM node:lts

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git ffmpeg imagemagick webp && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Clone the repository
RUN git clone https://github.com/Dark-Xploit/SPACE-MD.git /app

# Set working directory
WORKDIR /app

# Install Node dependencies
RUN npm install && npm cache clean --force

# Expose the port (change if needed)
EXPOSE 3000

# Set environment
ENV NODE_ENV production

# Start the app
CMD ["npm", "start"]
