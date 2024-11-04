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
   git clone https://github.com/your-username/symfony7-blank-template.git your-project-name
   cd your-project-name
   ```

2. **Install Dependencies**

   ```bash
   composer install
   ```

3. **Set Up Environment Variables**

   ```bash
   cp .env.example .env
   ```

   Update `.env` with your database credentials and other configuration details.

4. **Build and Start Docker Containers**

   Make sure to use `compose.local.yaml` and `compose.yaml` for Docker configuration.

   ```bash
   docker-compose -f compose.yaml -f compose.local.yaml up -d
   ```

5. **Set Up Database**

   Run migrations to prepare your database.

   ```bash
   docker-compose exec php php bin/console doctrine:migrations:migrate
   ```

## Usage

- **Controllers**: Create new controllers in `src/Controller`.
- **Routes**: Configure routes using annotations or YAML files.
- **Entities**: Define your entities in `src/Entity`.
- **Templates**: Use Twig templates in the `templates/` directory.

## Folder Structure

```
your-project-name/
├── config/
├── public/
├── src/
│   ├── Controller/
│   ├── Entity/
│   └── Repository/
├── templates/
├── tests/
├── var/
├── vendor/
├── .env
├── compose.yaml
├── compose.local.yaml
└── README.md
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit changes
4. Push to the branch
5. Open a pull request

## License

Licensed under the [MIT License](LICENSE).

---

