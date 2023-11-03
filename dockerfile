from python:3.8-bookworm

# Set the working directory to /app
WORKDIR /.

# Copy the current directory contents into the container at /.
COPY . /.

RUN pip install --no-cache-dir "openvino-dev[onnx,pytorch]==2022.3.0"

# Run the command to install any necessary dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Run hello.py when the container launches
ENTRYPOINT ["python","./demo.py"]

