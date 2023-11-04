# Dockerized Stable Diffusion OpenVino

I wanted to be able to run the stable-diffusion openvino model on an AWS EC2 instance, so I dockerized it for higher portability.

To accomplish this, I had to modify the demo.py script from the orginal project to wait for prompt input from the user instead of exiting after a single run. This keeps the docker container in a running state, and allows the user to run the model multiple times without having to download the model each time.

## Usage
You will need to provision an AWS EC2 instance with the following specs:
- AWS AMI 2023
- Instance type: c5.4xlarge
- 32 GB of EBS storage

Once the instance is provisioned, ssh into the instance and run the following commands:
```
sudo yum -y install git
sudo dnf install docker
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
newgrp docker
```

Next, you will need to clone this repo and build the docker image:
```
git clone
cd dockerized_stable_diffusion.openvino
docker build -t dockerized_stable_diffusion.openvino .
```

Once the docker image is built, you can run the docker container with the following command:
```
docker run -it dockerized_stable_diffusion.openvino
```
This starts the docker container in interactive terminal mode.

A command line text will appear asking you to enter the prompt for the image you want to generate.

After running, the image will be saved in the docker container. To save the image to your local machine, you will need to open a new terminal window and run the following command:
```
docker cp <container_id>:/output.png .
```
You can find the container_id by running the following command:
```
docker ps -a
```
The container_id will be the first column of the output.

To get the image to your local machine, use scp:
```
scp -i <path_to_pem_file> ec2-user@<ec2_public_ip>:~/image.png .
```

## References

- [Stable Diffusion OpenVino](<https://github.com/bes-dev/stable_diffusion.openvino>)

