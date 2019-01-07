# frozen_string_literal: true
# Generated with `rails generate valkyrie:model Item`
class Item < Ddr::Models::Base
  attribute :member_ids, Valkyrie::Types::Array
end
