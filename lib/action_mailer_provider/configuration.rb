require 'action_mailer_provider/strategies'

module ActionMailerProvider
  class Configuration
    ATTRIBUTES = [:provider, :domain, :default_email, :default_email_password]
    attr_accessor(*ATTRIBUTES)

    def initialize
    end

    def attributes
      Hash[ATTRIBUTES.map { |attr| [attr, public_send(attr)] }]
    end

    def reload
      strategy = ActionMailerProvider::Strategies.for(provider)
      strategy.new(attributes).configure if strategy
    end
  end

  class << self
    attr_accessor :config

    def configure(&block)
      config ||= Configuration.new
      yield config if block_given?
      config.reload
    end
  end
end
