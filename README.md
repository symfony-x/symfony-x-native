# Symfony-X

Symfony-X is a Symfony [LAST Stack](https://symfonycasts.com/screencast/last-stack/last-stack) rapid project development and deployment template for the purpose of creating a minimal viable product in minimal viable time.

Current Status
## NOT ready yet
ETA - a week-ish
#### As of 18 Nov 2024. 

Check back soon!

## Support [Ryan Weaver](https://github.com/weaverryan)

Ryan has Glioblastoma (brain cancer - [Go Fund Me](http://gofund.me/f8e28d5f).) He's a fighter, writer for http://SymfonyCasts.com & proud Symfony core member.

When I'm reading SymfonyDocs, it's Ryan's voice I hear in my mind. Gives me confidence and focus. 

Ryan, you are in my prayers.  

## About

The goal is to streamline the creation of a complete Symfony software project development and management environment. 

Symfony allows for fast development when done right. The problem, in my view, is setting up a modern Symfony development environment.

We live in the age of docker. The age of AI. 

I've seen the limitations of LLMs when used for development with Symfony...

- **Too many options**: Symfony is highly configurable. LLMs may respond with a suggestion that is odd, or worse, a hallucination. 

- **Too many versions**: Symfony has been around for a while. It has evolved over the years. Unfortunately, this means outdated and conflicting information used to train LLMs, so get things confused and use outdated methods in unpredicable ways. In general, they hallucinate more often and more subtly. 

- **Not current**: This is my largest overall frustration since i started using ChatGPT almost 2 years ago. Some of the stack is pretty new and evolving fast. Combine this with outdated info, and you're in no-mans-land.

I think I know how to fix a lot of this for Symfony developers. I'm going to write a web-app just to handle your project for RAG (RAG Graph) into your APIs. I'm also going to write some agentic systems to automate various tasks vital to rapid development (code creation, updates, docs, tests, configuration). These areas of improvement offer maximum utility for minimal cost. LLMs are good at things that are simple and explainable; especially when provided great context (RAG).

Then i'm going use to use Docker Compose to create a ready-to-go integrated development environment with all the services preconfigured for the Symfony-X system. Use your imagination: Ollama, Open Web UI, n8n, Gitea, AWS Dev Images, vector db, etc....

#### Abstracted Projects

Plans are for two projects:

- **Symfony-X** Super Simple Basic Website
- **Symfony-XXX** Forked from Symfony-X, a complete web app development and project environment.


## Stack

Symfony-X uses [Symfony Docker](https://github.com/dunglas/symfony-docker), [Franken-PHP](https://frankenphp.dev/) (on [Caddy](https://caddyserver.com/)), [Live Components](https://symfony.com/bundles/ux-live-component/current/index.html), [Asset Mapper](https://symfony.com/doc/current/frontend/asset_mapper.html) (NO Node.js, NO Webpack), [Stimulus](https://stimulus.hotwired.dev/), [Turbo](https://turbo.hotwired.dev/), [Tailwind](https://tailwindcss.com/), [Flowbite](https://flowbite.com/) 

## Deployments

Symfony-X deployments can be configured (local dev, local production, standalone binary executable, Amazon Web Services).

## AI

Symfony-X is focused on Artificial Intelligence progress and direction demands. This includes, but is not limited to: API consumption and production, LangChain-ish PHP, and maybe edge AI in application memory space (via Go).

## Background

An idea just barely needs to work before you really get started. Start sooner.

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

