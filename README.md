# Symfony-X

RAPID Symfony 7 Modern Web Architecture Development and Deployment.

## Background

**PHP** can get **down** and **dirty**. And *sometimes* **...** you have to do it ***symfony style***.

```php
  use Symfony\Component\Console\Style\SymfonyStyle;

  return new SymfonyStyle($down, $dirty);
```
Symfony-X is about simplicity, performance, and scalability.

## About

Symfony-X provides a set of fast, simple, and flexible Symfony 7+ templates for rapid project development using the latest Symfony design approaches.

Symfony-X uses a very fast web server (FrankenPHP), AssetMapper, and Tailwind. No yarn, no npm, and no webpackencore.

Symfony-X deployments can be configured (local dev, local production, standalone binary executable, AWS).

Symfony-X focuses on Artificial Intelligence adoption. This includes, but is not limited to: API consumption and production, LangChain-ish PHP, and maybe edge AI in application memory space (via Go).


## Requirements

- **Docker & Docker Compose**: 

## Installation

1. **Clone the Repository**

   ```bash
   git clone https://https://github.com/xormania/symfony-x.git your-project-name
   cd your-project-name
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
│   └── *
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

- **Web App Branch**: A ready to go web app template with dashboard (EasyAdmin).
- **AWS**: AWS integration. S3, Cognito, DynamoDB, Bedrock. 
- **Go**: Integrating Symfony with Go - maybe more later.
- **AI**: Integration with various AI. Possible edge LLM embedded in Caddy Server and available to php via bindings with Go functions(??). 


## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit changes
4. Push to the branch
5. Open a pull request

## License

Licensed under the [MIT License](LICENSE).

---

