class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :clinical
 
  validates_uniqueness_of :clinical_id, scope: :user_id
end
