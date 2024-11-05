# XOR - Symfony 7 Template

A minimal template for starting a Symfony 7 project, designed for a streamlined setup with essential configurations only.

## Requirements

- **PHP**: ^8.1
- **Composer**: ^2.0
- **Docker & Docker Compose**: For containerized development
- **Database**: Choose based on project requirements (e.g., MySQL, PostgreSQL)

## Installation

1. **Clone the Repository**

   ```bash
   git clone https://https://github.com/xormania/symfony-x.git your-project-name
   cd your-project-name
   ```

2. **Install Dependencies**

   ```bash
   composer install
   ```

4. **Build and Start Docker Containers**

   Make sure to use `compose.override.yaml` for Development Docker configuration.
   Make sure to use `compose.prod.yaml` for Production Docker configuration.

   ```bash
   docker-compose up -d
   ```

## Documentation

   Documentation can be found [here](docs/documents.md). 

## Folder Structure

```
symfony-x/
├── .vscode/
├── assets/
│   └── styles/
├── bin/
├── config/
│   ├── packages/
│   └── routes/
├── docs/
│   └── makefile/
├── frankenphp/
│   └── conf.d/
├── public/
├── src/
│   └── Controller/
├── templates/
├── tests/
├── var/
├── vendor/
├── .env
├── compose.override.yaml
├── compose.prod.yaml
├── compose.yaml
├── Dockerfile
├── importmap.php
├── Makefile
├── README.md
├── symfony-x.code-workspace
└── symfony.lock
```

## Plans

- **Web App version**: A ready to go web app template with dashboard.
- **AWS**: AWS integration. S3, Cognito, DynamoDB, Bedrock, 
- **Go**: Integrating Symfony with Go - maybe more later
- **AI**: Integration with various AI. Possible edge LLM embedded in Server and available to php via bindings with Go functions. 


## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit changes
4. Push to the branch
5. Open a pull request

## License

Licensed under the [MIT License](LICENSE).

---

