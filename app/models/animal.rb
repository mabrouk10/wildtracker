class Animal < ApplicationRecord
    has_many :sights
    accepts_nested_attributes_for :sights


    validates :name, :latin, :kingdom, presence: true

    validates :name, uniqueness: true
    validates :latin, uniqueness: true

    validate :name_latin
    def name_latin
        if self.name == self.latin
            errors.add(:name, "Cannot be the same as latin.")
            errors.add(:latin, "Cannot be the same as name.")
        end
    end

end
