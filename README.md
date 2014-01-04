# ActionMailerProvider

Never again shall you have production errors due to wrong mail configuration

This is a simple helper gem that configures your rails SMTP settings according
to your provider.

## Installation

Add this line to your application's Gemfile:

    gem 'action_mailer_provider'

And bundle:

    $ bundle install

Finally, use the generator to create the initializer file with your desired
settings. By default, all data will be fetched from environment variables,
although you can override that in the generator prompt.
I do recommend using the environment variables through [dotenv](https://github.com/bkeepers/dotenv)) or another similar tool, as they are easier to update later, and more secure (your email password in kept in an untracked file)

```
$ rails generate action_mailer_provider:install
By default, values will be fetched through env variables. Would you like to customize them instead? [yN] y
What provider would you like to use? [ENV['EMAIL_PROVIDER']] zoho
What's your email domain? [ENV['EMAIL_DOMAIN']] my.domain.com
What's the email address to use? [ENV['EMAIL_USERNAME']] my-account@my.domain.com
Email password [ENV['EMAIL_PASSWORD']] my-password
      create  config/initializers/action_mailer_provider.rb
```

## Providers

Currently the only supported providers are [ZohoMail](https://www.zoho.com/mail/) (`zoho`) and [Gmail](mail.google.com) (`gmail`)
Each of them requires only that you speficy your custom domain, and default
email account and password to use. The rest (smtp address, port, ssl, etc) is
handled automatically

## Why a gem for such a trivial task?

Because i kept copying the same configuration over and over across every
application, sometimes leading to errors only discovered in production

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
