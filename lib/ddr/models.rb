require 'valkyrie'
require 'ddr/models/engine'
require 'ddr/models/version'

module Ddr
  extend ActiveSupport::Autoload

  autoload :Vocab

  module Models
    extend ActiveSupport::Autoload

    autoload :Base
    autoload :HasMetadata
    autoload :Captionable
    autoload :Governable
    autoload :HasAttachments
    autoload :HasChildren
    autoload :HasContent
    autoload :HasIntermediateFile
    autoload :HasMultiresImage
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

    # Maps media types to preferred file extensions
    mattr_accessor :preferred_file_extensions do
      {
          'application/zip' => 'zip',
          'audio/mp4'       => 'm4a',
          'audio/mpeg'      => 'mp3',
          'audio/ogg'       => 'ogg',
          'audio/wav'       => 'wav',
          'text/vtt'        => 'vtt',
          'video/flv'       => 'flv',
          'video/mp4'       => 'mp4',
          'video/quicktime' => 'mov',
          'video/webm'      => 'webm'
      }
    end

    def self.configure
      yield self
    end

  end
end

Dir[Ddr::Models::Engine.root.to_s + "/app/models/*.rb"].each { |m| require m }
