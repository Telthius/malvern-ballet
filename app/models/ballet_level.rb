class BalletLevel < ApplicationRecord
  has_many :ballet_classes
  has_many :costs
  has_one_attached :picture

  def description_for_view()
    description.to_s.gsub(/\n/, '<br/>').html_safe
  end
end
