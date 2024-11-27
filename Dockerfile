# Use the official TensorFlow image as a base
FROM tensorflow/tensorflow:latest

# Set the working directory inside the container
WORKDIR /app

# Copy requirements.txt and other necessary files into the container
COPY requirements.txt ./
COPY tokenizer.pickle ./
COPY transformer_weights.h5 ./
COPY Api_flask.ipynb ./

# Install the required packages
RUN pip install --no-cache-dir --timeout=120 -r requirements.txt

# Install Jupyter Notebook
RUN pip install jupyter

# Expose the port the app runs on
EXPOSE 5000

# Command to run the Jupyter notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=5000", "--no-browser", "--allow-root"]
