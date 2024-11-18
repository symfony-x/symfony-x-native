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

The goal is to streamline the creation of a rapid Symfony software project development environment. 

Symfony allows for fast development when done right. The problem, in my view, is setting up a modern Symfony development environment.

We live in the age of docker. The age of AI. 

I've seen the limitations of Large Language Models (LLMs) when used to assist with Symfony development...

- **Too many options**: Symfony is highly configurable, almost to a fault. Without the model knowing the desired configuration setup of YOUR project, and with so many implemention options to choose from, the model may respond with a suggestion that is sub-optimal, creates new conflicts, or worse, is a hallucination (confusing techniques from different implementation options - i.e. confusing Asset with AssetMapper). 

- **Too many versions**: Symfony has been around for a while. It has evolved over the years. Unfortunately, this means outdated and conflicting information is used to train LLMs, so they get things confused (features vs versions) and use outdated techniques ( i.e. - using annotations instead of attributes) in unpredicable ways. It also means that info on the latest Symfony version is drowned out by previous versions when training the LLM. In general, models will hallucinate more often, and in more subtle ways. 

- **Not current**: This is my largest overall frustration since i started using ChatGPT almost 2 years ago: The Cutoff Date! Some of the stack is relatively new and evolving fast. Combine this with too many Symfony versions, and you're in No Man's Land. RAG and search can help, but need to be tailored for the project. Fine tuning models on information specific to your project's current configuration (versions: php, symfony, packages, libraries, api, cli, etc.) combined with RAG-Graph seems like the right direction. 

Check out this [video](https://www.youtube.com/watch?v=5YZ8mMyHJHg) to understand some of the challenges of applying AI. 

I have some ideas to help. A web app to handle RAG with your projects codebase. Use with your API calls - crafting every interaction with knowledge of your code and tailored for Symfony-X stack.

I'm also going to write some agentic systems to automate various tasks vital to rapid development (code creation, updates, docs, tests, configuration). These areas of improvement offer maximum utility for minimal cost. LLMs are good at things that are simple and explainable, especially when provided great context (RAG).

Then I'm going to use Docker Compose to create a ready-to-go integrated development environment with all the services preconfigured for the Symfony-X system (db, git, dev tools like phpMyAdmin, etc.).

Use your imagination: Ollama, Open Web UI, MongoDB, n8n, Gitea, Local AWS Dev (DynamoDB, S3, Cognito, ElasticSearch, etc.).

While that's all nice, I'm lazier still... it HAS to be ridiculously easy to get a minimal viable product into production. I want to be able to describe what I want and then have the system interactively interrogate me as the product begins to take shape (like diffusion). The goal is up and running ASAP. I'll set up a speed run leaderboard. So there should be some basic example [workflows](https://symfony.com/doc/current/components/workflow.html) to help guide development. Combined with [AI](https://github.com/theodo-group/LLPhant), this should be able to automate A LOT. 


## Symfony-X and Symfony-XXX

Plans are for three github repos:

- **Symfony-X** Super Simple Basic Web App, a simple template containing basic Symfony Web App and development features such as Dockerfile and production deployments. 
- **Symfony-X2** Forked from Symfony-X, adds the development and project environment (Database, Docker Compose, AI). Useful for creating micro-services.
- **Symfony-XXX** Forked from Symfony-X2, adds advanced web app features such as Users, OAuth, Dashboards, API libraries, DevOps.

Ultimately these will probably just be dev repos. I'd like to have a Symfony new project skeleton, maybe a bundle (with composer package) for even easier integration and versioning.



## Stack

Symfony-X uses [Symfony Docker](https://github.com/dunglas/symfony-docker), [Franken-PHP](https://frankenphp.dev/) (on [Caddy](https://caddyserver.com/)), [Live Components](https://symfony.com/bundles/ux-live-component/current/index.html), [Asset Mapper](https://symfony.com/doc/current/frontend/asset_mapper.html) (NO Node.js, NO Webpack), [Stimulus](https://stimulus.hotwired.dev/), [Turbo](https://turbo.hotwired.dev/), [Tailwind](https://tailwindcss.com/), [Flowbite](https://flowbite.com/) 

## Deployments

Symfony-X deployments can be configured (local dev, local production, standalone binary executable, Amazon Web Services).

## AI

Data is paramount.

The more project development data you can log, scrub, and synthesize; the more insights you can gain from it using AI.

For example, create a temp local git branch and make available (via RAG Agent) to developer API or local LLM. Autocomit on save, and track all changes with references to your chat history (via comments in code examples with GUID or something). Pull only the final changes and save the temp brach history for future use. You can use machine learning on it for insights or to improve. 

My point is that we should all be trying to capture as much data about the development process as possible. 

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

