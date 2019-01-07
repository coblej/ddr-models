require 'valkyrie'
require "ddr/models/engine"
require 'ddr/models/version'

module Ddr
  extend ActiveSupport::Autoload

  module Models
    extend ActiveSupport::Autoload

    autoload :Base
    autoload :Metadata
    autoload :HasContent

    def self.configure
      yield self
    end

  end
end

Dir[Ddr::Models::Engine.root.to_s + "/app/models/*.rb"].each { |m| require m }
