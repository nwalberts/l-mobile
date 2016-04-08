class Phone < ActiveRecord::Base
  belongs_to :operating_system

  validates :manufacturer, presence: true
  validates :size, presence: true
  validates :operating_system, presence: true
  validates :charging_port, presence: true
  validates :model, presence: true

  def instock
    if !quantity.blank? && quantity > 0
      return true
    end
    return false
  end


end
