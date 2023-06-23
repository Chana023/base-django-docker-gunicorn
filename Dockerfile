# Use an official Python runtime as the base image
FROM python:3.9

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the working directory
COPY requirements.txt .

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Django project code to the working directory
COPY . .

# Expose the port on which your Django app runs (change it if necessary)
EXPOSE 8000

# Run the Django app using Gunicorn
CMD ["gunicorn", "violet.wsgi:application", "--bind", "0.0.0.0:8000"]
