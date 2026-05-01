# Use a lightweight Nginx image
FROM nginx:alpine

# Copy your HTML file into the Nginx public directory
# Note: Ensure your file is named 'index.html'
COPY index.html /usr/share/nginx/html/index.html

# Expose port 8080 (Cloud Run's default)
EXPOSE 8080

# Configure Nginx to listen on 8080 instead of 80
RUN sed -i 's/listen[[:space:]]*80;/listen 8080;/g' /etc/nginx/conf.d/default.conf

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]