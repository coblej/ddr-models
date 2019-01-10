require 'valkyrie'
require "ddr/models/engine"
require 'ddr/models/version'

module Ddr
  extend ActiveSupport::Autoload

  module Models
    extend ActiveSupport::Autoload

    autoload :Base
    autoload :Metadata
    autoload :Governable
    autoload :HasContent
    autoload :HasStructMetadata
    autoload :HasThumbnail
    autoload :Structure

    module Structures
      extend ActiveSupport::Autoload
      autoload :Agent
      autoload :Div
      autoload :File
      autoload :FileGrp
      autoload :FileSec
      autoload :FLocat
      autoload :Fptr
      autoload :MetsHdr
      autoload :Mptr
      autoload :StructMap
      autoload :ComponentTypeTerm
    end

    def self.configure
      yield self
    end

  end
end

Dir[Ddr::Models::Engine.root.to_s + "/app/models/*.rb"].each { |m| require m }
