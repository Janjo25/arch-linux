# Minikube

## How to Install Minikube

1. **Install Minikube and kubectl:**
   To get started with Kubernetes on your local machine, you need to install Minikube, which is a tool that makes it
   easy to run Kubernetes locally. `kubectl` is the command-line tool for interacting with Kubernetes. Install both
   using the following command:

   ```bash
   sudo pacman -S minikube kubectl
   ```

2. **Verify Installation:**
   After installation, check if Minikube is installed correctly by running:

   ```bash
   minikube version
   ```

---

## How to Use Minikube

1. **Start the Minikube Instance:**
   To start a Minikube instance, run the following command. This will download the necessary image, which might take
   some time:

   ```bash
   minikube start
   ```

2. **Verify the Status of the Minikube Cluster:**
   Check the status of your Minikube cluster to ensure it's running correctly:

   ```bash
   minikube status
   ```

3. **Change to the Docker Environment Inside the Minikube Cluster:**
   To build Docker images within the Minikube environment, execute:

   ```bash
   eval $(minikube docker-env)
   ```

   **Note:** It is important to build the Docker images inside the Minikube environment for them to work properly with
   Kubernetes.

4. **Verify Docker Images:**
   Once all the necessary images are built, check your Docker images with:

   ```bash
   docker images
   ```

5. **Apply Kubernetes Resources:**
   Once you're sure that all the images are built, you can apply your Kubernetes resources using:

   ```bash
   kubectl apply -f <path_to_your_yaml_file>
   ```

6. **Verify that the Applied Resources Were Correctly Created:**
   Check the resources you applied to ensure they were created correctly:

   ```bash
   kubectl get <resource_type>
   ```

7. **Access the Service from Minikube:**
   If all the necessary resources were applied correctly, you can access the service using:

   ```bash
   minikube service <your_service_name>
   ```
