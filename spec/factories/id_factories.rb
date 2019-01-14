FactoryBot.define do

  factory :valkyrie_id, class: Valkyrie::ID do
    initialize_with do
      new(SecureRandom.uuid)
    end
  end

end
