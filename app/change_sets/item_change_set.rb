class ItemChangeSet < Valkyrie::ChangeSet

  # Fields listed here default to multiple, not required, empty array
  self.fields = [ :contributor, :coverage, :creator, :date, :description, :format, :identifier, :language, :publisher,
                  :relation, :rights, :source, :subject, :type ]

  property Valkyrie::Persistence::Attributes::OPTIMISTIC_LOCK, multiple: true, required: true,
                type: Valkyrie::Types::Set.of(Valkyrie::Types::OptimisticLockToken)
  property :title, multiple: false, required: true

  validates :creator, presence: true
  validates :title, presence: true

end
