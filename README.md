# Symfony-X

Symfony-X is a Symfony [LAST Stack](https://symfonycasts.com/screencast/last-stack/last-stack) rapid project development and deployment template for the purpose of creating a minimal viable product in minimal viable time.

Current Status
### NOT ready yet
ETA - a week-ish
#### As of 16 Nov 2024. 

Check back soon!

## Support [Ryan Weaver](https://github.com/weaverryan)
Ryan has Glioblastoma (brain cancer - [Go Fund Me](http://gofund.me/f8e28d5f).) He's a fighter, writer for http://SymfonyCasts.com & proud Symfony core member.

When I'm reading SymfonyDocs, it's Ryan's voice I hear in my mind. Gives me confidence and focus. 

Ryan, you are in my prayers.  

## About

Symfony-X provides a set of fast, simple, and flexible Symfony 7+ templates for rapid project development using LAST stack.

Symfony-X uses [Symfony Docker](https://github.com/dunglas/symfony-docker), [Franken-PHP](https://frankenphp.dev/) (on [Caddy](https://caddyserver.com/)), [Live Components](https://symfony.com/bundles/ux-live-component/current/index.html), [Asset Mapper](https://symfony.com/doc/current/frontend/asset_mapper.html) (NO Node.js, NO Webpack), [Stimulus](https://stimulus.hotwired.dev/), [Turbo](https://turbo.hotwired.dev/), [Tailwind](https://tailwindcss.com/), [Flowbite](https://flowbite.com/) 

Symfony-X deployments can be configured (local dev, local production, standalone binary executable, Amazon Web Services).

Symfony-X is focused on Artificial Intelligence progress and direction demands. This includes, but is not limited to: API consumption and production, LangChain-ish PHP, and maybe edge AI in application memory space (via Go).

## Background

An idea just barely needs to work before you really start. Start sooner.

#### Why PHP/Symfony?

**PHP** can get **down** and **dirty**. And *sometimes* **...** you have to do it ***symfony style***.

```php
  use Symfony\Component\Console\Style\SymfonyStyle;

  return new SymfonyStyle($down, $dirty);
```

Symfony-X is about simplicity, performance, and scalability.

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

   [Click Here](dev/symfony-x/documentation/documents.md) for the Symfony-X documentation.


## Plans

- **Web App**: Forked from this repo, rapid web app development / deployment.
- **Redneck Mode**: ALL servers/services/sites/workers/mercure/db/etc in one container. extend your docker image from it to add. The one server wonder!
- **Docker Compose**: Comprehensive Docker Compose setup for the best Symfony AI Development experience.

## Thoughts on direction

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

