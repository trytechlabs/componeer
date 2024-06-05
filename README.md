# Componeer

A non-intrusive gem for component-based development in Ruby on Rails.

## Description

Componeer is a non-intrusive gem that enhances component-based development
in Ruby on Rails applications. It empowers developers to effortlessly build modular, reusable,
and highly maintainable UI components within their Rails projects. With an intuitive syntax and
comprehensive features, Componeer simplifies component management, promotes code reusability,
and enhances the scalability and flexibility of your Rails applications.

## Get started

### How to usage

Componeer is based on TailwindCSS framework but it doesn't enforce you an instalation for this
library, unless you ask for it.

To begin using this gem, add this line to your application's Gemfile:

```ruby
gem 'componeer'
```

And then execute:

```bash
$ bundle install
```

### Load componeer js and tailwind classes

Add this line to your `tailwind.config.js`, under `content`:

```js
module.exports = {
  content: [
    `...`, // Your content paths
    ...require('@trytechlabs/componeer').contentPaths,
  ],
}
```

Now, you can use our different installers for the things that you might want:

### TailwindCSS

```
$ bundle exec rails componeer:install:tailwindcss
```

## Contributing

Internal only at this moment

## License

TBD
