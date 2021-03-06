require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event){ build :event }

  describe 'Validations' do
    it{ should validate_presence_of :name }
    it{ should validate_presence_of :start_time }
  end

  describe 'Associations' do
    it{ should have_many :attendances }
    it{ should have_many(:users).through(:attendances) }

    it{ should have_one :address }

    describe 'Address' do
      it 'should geocode the address upon save' do
        pending 'Passes unless Rails.env.test? to avoid billions of api calls'

        a = event.address
        a.street = '4218 S. Mt. Angeles Rd'
        a.zip = '98362'

        a.latitude.should == nil

        event.save!

        a.geocoded?.should == true
      end
    end
  end

  describe 'Attributes' do
  end
end
