require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
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

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

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
