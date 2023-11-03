from python:3.8-slim-buster

# Set the working directory to /app
WORKDIR /.

# Copy the current directory contents into the container at /.
COPY . /.

RUN apt update && apt install -y libsm6 libxext6 ffmpeg libfontconfig1 libxrender1 libgl1-mesa-glx

RUN python -m pip install --upgrade pip

RUN pip install  "openvino-dev[onnx,pytorch]==2022.3.0"
# Run the command to install any necessary dependencies
RUN pip install --no-cache-dir -r requirements.txt


# Run hello.py when the container launches
ENTRYPOINT ["python","./demo.py"]

