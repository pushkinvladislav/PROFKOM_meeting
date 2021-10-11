class Event < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :account
  has_many :students
  validates :name, presence: true
  validates :information, presence: true
  validates :photo, presence: true

  scope :active, -> { where('activation') }
  scope :preview, -> { where('preview') }
  scope :archive, -> { where('(preview = false)and(activation = false) ') }
end
