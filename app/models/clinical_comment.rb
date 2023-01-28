class ClinicalComment < ApplicationRecord
    
  belongs_to :user
  belongs_to :clinical

  validates :comment, presence: true
end
