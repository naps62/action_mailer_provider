require 'action_mailer_provider/strategies/zoho'
require 'action_mailer_provider/strategies/gmail'

module ActionMailerProvider
  module Strategies
    def self.for(provider)
      if provider
        const = mapping(provider)
        const_get(const) if const_defined?(const)
      end
    end

    private

    def self.mapping(provider)
      provider.to_s.split('_').map { |w| w.capitalize }.join.to_sym
    end
  end
end
