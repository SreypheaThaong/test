# Use official Nginx image
FROM nginx:alpine

# Set working directory
WORKDIR /usr/share/nginx/html

# Remove default Nginx index page
RUN rm -rf ./*

# Copy your HTML and assets into the container
COPY book.html .
# COPY assets/ ./assets   # (optional if you have CSS/JS/images)

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]

