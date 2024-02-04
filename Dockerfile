# Use an official Node.js runtime as a parent image
FROM node:20

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and bun.lockb to the container
COPY package.json pnpm-lock.yaml ./

# Install Bun
RUN npm install -g pnpm

# Install project dependencies using Bun
RUN pnpm install

# Copy the rest of the application code to the container
COPY . .

# Build your SvelteKit application using Bun
RUN pnpm run build

# Expose the port your SvelteKit app will run on
ENV PORT=8080
EXPOSE $PORT

# Start the SvelteKit application
CMD ["pnpm", "./build/index.js"]