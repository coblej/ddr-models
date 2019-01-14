module Ddr::Models
  module HasMultiresImage
    extend ActiveSupport::Concern

    included do
      attribute :multires_image_identifier, Valkyrie::Types::String.optional
    end

    def multires_image_file_path
      multires_image.disk_path
    end

    private

    def multires_image
      @multires_image ||= storage_adapter.find_by(id: multires_image_identifier)
    end

  end
end
