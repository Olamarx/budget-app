![](https://img.shields.io/badge/Microverse-blueviolet)

## Recipe-APP

> This is an outstanding app which keeps track of expenses based on category. This is a Ruby on Rails app with touch of bootstrap. It has full form of authentication including email and password. To add, it is fully tested.

## Built With

- Ruby on Rails
- devise && cancancan
- PostgreSQL
- bullet
- bootstrap && css
- rspec/rails & capybara
## Live Demo

### Tools

💠VISUAL STUDIO CODE

## Getting Started

### Prerequisites

- Ruby ruby-3.1.2 installed
- PostgreSQL dbms running

## Setup Project

- Open your terminal and go to the folder you want to save the project.

- Type these commands into the terminal:

```
git clone https://github.com/Olamarx/budget-app.git
cd budget-app
bundle install
```

- You will need a `.env` file before you install and run the project. The `.env` file contains environment variables needed to deploy the webpage. There is a commented `.env.example` file you can use as a guide to configure your own. Type the following command into the terminal (or Git Bash, if using Windows) to create your `.env` file:

```
cp .env.example .env
rails secret
```

- Edit file .env

  - Replace the value for the variable DEVISE_JWT_SECRET_KEY with the value returned by the `rails secret` command.
  - Provide values for DATABASE_HOST, DATABASE_USER and DATABASE_PASSWORD

- Type this command into the terminal to reset the database:

```
rails db:reset
```
### Run application locally on your server

- Type this commands into the terminal:

```
rails server
```

- Open your web browser at [http://127.0.0.1:3000](http://127.0.0.1:3000)

### Run tests

- Type these commands into the terminal:

```
rspec spec -f doc lib
```

## Authors

👤 **Owoeye Olaoluwa (Olamarx)**

- GitHub: [@githubhandle](https://github.com/Olamarx)
- Twitter: [@twitterhandle](https://twitter.com/Owoeye0laoluwa)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/olaoluwa-owoeye-617702162/)
- Facebook: [Facebook](https://web.facebook.com/olaoluwa.owoeye.39)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Thank You goes to [Gregoire Vella](https://www.behance.net/gregoirevella) on [Behance](https://www.behance.net/) for this beautiful [Snapscan - iOs design and branding](https://www.behance.net/gallery/19759151/Snapscan-iOs-design-and-branding) template.
- Thanks to my good friend, Daniel Malo for standing by always.
- Thanks to one of my motivators and helper, Agudelo Andres for standing by always.
