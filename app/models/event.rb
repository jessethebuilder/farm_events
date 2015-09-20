class Event < ActiveRecord::Base
  # include Bootsy::Container
  extend SimpleCalendar
  has_calendar

  save_draft_archive_delete

  has_one :address, as: :has_address
  accepts_nested_attributes_for :address

  use_farm_slugs

  validates :name , presence: true
  validates :start_time, presence: true

  after_initialize do
    build_address if address.nil?
  end

  before_save do
    # address.geocode
    address.geocode unless Rails.env.test?
  end

  def starts_at
    start_time
  end
end
