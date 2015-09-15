require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :name => "MyString",
      :description => "MyText",
      :keywords => "MyText",
      :facebook_event_link => "MyString",
      :main_image => "MyString",
      :slug => "MyString",
      :published => false,
      :archived => false
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input#event_name[name=?]", "event[name]"

      assert_select "textarea#event_description[name=?]", "event[description]"

      assert_select "textarea#event_keywords[name=?]", "event[keywords]"

      assert_select "input#event_facebook_event_link[name=?]", "event[facebook_event_link]"

      assert_select "input#event_main_image[name=?]", "event[main_image]"

      assert_select "input#event_slug[name=?]", "event[slug]"

      assert_select "input#event_published[name=?]", "event[published]"

      assert_select "input#event_archived[name=?]", "event[archived]"
    end
  end
end
