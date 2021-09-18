class Note < ApplicationRecord
  validates :content, presence: true
  belongs_to :worker
end
