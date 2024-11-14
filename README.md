# Symfony-X

Symfony 7 LAST Stack rapid Project Development and Deployment / Distribution.

Current Status
### NOT ready yet
ETA - a week-ish
#### As of 14 Nov 2024. 

Check back soon!

## Support [Ryan Weaver](https://github.com/weaverryan)
Ryan has Glioblastoma (brain cancer - [Go Fund Me](http://gofund.me/f8e28d5f).) He's a fighter, writer for http://SymfonyCasts.com & proud Symfony core member.

When I read SymfonyDocs, it's his voice I hear. Gives me confidence and clarity. 

Ryan, you are in my prayers.  

## Background

**PHP** can get **down** and **dirty**. And *sometimes* **...** you have to do it ***symfony style***.

```php
  use Symfony\Component\Console\Style\SymfonyStyle;

  return new SymfonyStyle($down, $dirty);
```
Symfony-X is about simplicity, performance, and scalability.

## About

Symfony-X provides a set of fast, simple, and flexible Symfony 7+ templates for rapid project development using the latest Symfony design approaches.

Symfony-X uses a fast web server (FrankenPHP), AssetMapper, and Tailwind. No yarn, no npm, and no webpackencore.

Symfony-X deployments can be configured (local dev, local production, standalone binary executable, Amazon Web Services).

Symfony-X is focused on Artificial Intelligence progress and direction demands. This includes, but is not limited to: API consumption and production, LangChain-ish PHP, and maybe edge AI in application memory space (via Go).


## Requirements

- **Git**: You got to git it to get it. 
- **Docker & Docker Compose**: Containerized environments.

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

   [Click Here](dev/symfony-x/documentation/documents.md). 


## Thoughts on direction

- **Web App Fork**: A ready to go web app template with doctrine, security, dashboard (EasyAdmin)
- **Docker**:  Docker Compose for dev tools (open-web-ui/ollama/db/n8n/watchtower/etc/) and environment simulation (local / aws / etc).
- **AWS**: AWS integration (dev and prod). S3, Cognito, DynamoDB, Bedrock. -> automate deployments with Cloud Formation
- **Go**: Integrating Symfony with Go - maybe more later.
- **AI**: Integration with various AI. 


## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit changes
4. Push to the branch
5. Open a pull request

## License

Licensed under the [MIT License](LICENSE).

---

