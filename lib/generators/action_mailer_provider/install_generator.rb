require 'rails/generators/base'

module ActionMailerProvider
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path '../templates', __FILE__

      def install
        set_defaults
        if yes?('By default, values will be fetched through env variables. Would you like to customize them instead? [yN]')
          override_default(:provider, 'What provider would you like to use?')
          override_default(:domain, 'What\'s your email domain?')
          override_default(:email, 'What\'s the email address to use?')
          override_default(:password, 'Email password')
        end
        template 'initializer.rb.erb', 'config/initializers/action_mailer_provider.rb'
      end

      private

      attr_accessor :provider, :domain, :email, :password

      def quote(str)
        "'#{str}'"
      end

      def set_defaults
        @provider = "ENV['EMAIL_PROVIDER']"
        @domain = "ENV['EMAIL_DOMAIN']"
        @email = "ENV['EMAIL_USERNAME']"
        @password = "ENV['EMAIL_PASSWORD']"
      end

      def override_default(attr, question)
        new_value = ask("#{question} [#{public_send(attr)}]")
        if new_value.size > 0
          public_send("#{attr}=", quote(new_value))
        end
      end
    end
  end
end
