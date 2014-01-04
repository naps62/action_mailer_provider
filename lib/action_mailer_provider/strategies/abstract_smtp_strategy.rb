module ActionMailerProvider
  module Strategies
    class AbstractSmtpStrategy
      attr_reader :attributes

      def initialize(attributes)
        @attributes = attributes
      end

      def configure
        ActionMailer::Base.smtp_settings = defaults.merge(configuration)
      end

      def configuration
        raise 'AbstractStrategy called for ActionMailerProvider'
      end

      private

      def defaults
        {
          domain: attributes[:domain],
          user_name: attributes[:default_email],
          password: attributes[:default_email_password],
          authentication: :plain,
          enable_starttls_auto: true
        }
      end
    end
  end
end
