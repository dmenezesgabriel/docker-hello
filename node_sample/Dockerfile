FROM node:14
WORKDIR /app
# Set  build-time variables
ARG PORT=6000
# Set environment variables
ENV PORT=${PORT}
# Make port 6000 available to the world outside this container
EXPOSE ${PORT}
# Copy the current directory contents into the container at WORKDIR
COPY . .
RUN npm install
ENTRYPOINT npm start
