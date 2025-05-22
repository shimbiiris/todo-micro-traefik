# Dockerfile & Docker Compose Set up

This Repo Contains the code for a microservice application comprising of several components communicating to each other. In other words, this is an example of microservice. These microservices are written in different languages.

The app itself is a simple TODO app that additionally authenticates users.

## Components

1. [Frontend](/frontend) part is a Javascript application, provides UI. Created with [VueJS](http://vuejs.org)
2. [Auth API](/auth-api) is written in Go and provides authorization functionality. Generates JWT tokens to be used with other APIs.
3. [TODOs API](/todos-api) is written with NodeJS, provides CRUD functionality ove user's todo records. Also, it logs "create" and "delete" operations to Redis queue, so they can be later processed by [Log Message Processor](/log-message-processor).
4. [Users API](/users-api) is a Spring Boot project written in Java. Provides user profiles. Does not provide full CRUD for simplicity, just getting a single user and all users.
5. [Log Message Processor](/log-message-processor) is a very short queue processor written in Python. It's sole purpose is to read messages from Redis queue and print them to stdout


The diagram describes the various components and their interactions.
![microservice-app-example](https://user-images.githubusercontent.com/1905821/34918427-a931d84e-f952-11e7-85a0-ace34a2e8edb.png)

## Prerequisites

Before you begin, ensure you have the following installed:
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## How to Run

1.  **Set up environment variables:**
    *   Create a `.env` file by copying the contents of `env.example`:
        ```bash
        cp env.example .env
        ```
    *   Open the `.env` file and set the `DOMAIN_NAME` variable:
        *   If you are running the application locally, set `DOMAIN_NAME=localhost`.
        *   If you are deploying the application to a server, set `DOMAIN_NAME` to your domain (e.g., `DOMAIN_NAME=yourdomain.com`).

2.  **Build the Docker images:**
    ```bash
    docker compose build
    ```

3.  **Run the application:**
    ```bash
    docker compose up
    ```

Note: 3 different login details are provided in the .env file 

## License

MIT
