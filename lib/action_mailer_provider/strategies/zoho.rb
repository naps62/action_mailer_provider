require 'action_mailer_provider/strategies/abstract_smtp_strategy'

module ActionMailerProvider
  module Strategies
    class Zoho < AbstractSmtpStrategy
      def configuration
        {
          address: 'smtp.zoho.com',
          port: 465,
          ssl: true,
          tls: true
        }
      end
    end
  end
end
