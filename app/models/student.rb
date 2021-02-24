class Student < ApplicationRecord
  belongs_to :event
  validates :first_name, :second_name, :email, :group, :bilet, :faculty, :phone, presence: true

  def self.to_csv(options = {})
    attributes = %w[second_name event_id first_name email group faculty bilet phone vk_id visit]
    CSV.generate(options) do |csv|
      csv << attributes
      all.each do |student|
        csv << student.attributes.values_at(*attributes)
      end
    end
  end
end
