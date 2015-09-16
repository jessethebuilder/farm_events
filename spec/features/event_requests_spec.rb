require 'rails_helper'

describe 'Event Requests' do
  describe 'Farm Slugs' do
    specify 'they should work' do
      test_name = 'Test Event Name'
      create :event, :name => test_name
      visit "/events/#{test_name.parameterize}"
      page.status_code.should == 200
      page.should have_content(test_name)
    end
  end

  describe 'End to End' do
    let(:name){ 'Test Name' }
    let(:start){ Time.now + Random.rand(1..10000).hours }
    let(:description){ Faker::Lorem.paragraphs(paragraph_count = Random.rand(1..20)).join('<br><br>') }
    let(:keywords){ Faker::Lorem.words(num = Random.rand(1..1000)).join(', ') }
    let(:facebook_event_link){ "http://facebook.com/events/#{Faker::Lorem.word}" }

    def min
      visit '/events/new'
      fill_in 'Name', with: name

      find('#event_start_time_1i').find(:xpath, 'option[1]').select_option
      find('#event_start_time_2i').find(:xpath, 'option[1]').select_option
      find('#event_start_time_3i').find(:xpath, 'option[1]').select_option
      find('#event_start_time_4i').find(:xpath, 'option[1]').select_option
      find('#event_start_time_5i').find(:xpath, 'option[1]').select_option
    end

    it 'should accept the minimum values through the form, and save the object' do
      min
      expect{ click_button 'Publish' }.to change{Event.count}.by(1)

      page.current_path.should == '/events/test-name'
    end

    it 'should accept all basic values through the from, and save them' do
      min
      fill_in 'Description', with: description
      fill_in 'Keywords', with: keywords
      fill_in 'Facebook event link', with: facebook_event_link
      click_button 'Publish'

      e = Event.last
      e.name.should == name
      # Time.parse(e.start_time).should == start
      e.description.should == description
      e.keywords.should == keywords
      e.facebook_event_link.should == facebook_event_link
    end

    it 'should accept address params' do
      min
      fill_in 'Name of location', with: 'Test Location'
      fill_in 'Street', with: '1234 Street'
      fill_in 'Street2', with: 'Ste 123'
      fill_in 'City', with: 'A City'
      find('#event_address_attributes_state').find(:xpath, 'option[2]').select_option
      fill_in 'Zip', with: '12345'

      click_button 'Publish'

      a = Event.last.address
      a.label.should == 'Test Location'
      a.street.should == '1234 Street'
      a.street2.should == 'Ste 123'
      a.city.should == 'A City'
      a.state.should == 'AK'
      a.zip.should == '12345'

    end
  end # End To End

  describe 'Editing Events Requests' do
    let!(:event){ create(:event) }
  end
end


