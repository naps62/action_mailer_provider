require 'action_mailer_provider/strategies/abstract_smtp_strategy'

module ActionMailerProvider
  module Strategies
    class Gmail < AbstractSmtpStrategy
      def configuration
        {
          address: 'smtp.gmail.com',
          port: 587
        }
      end
    end
  end
end
