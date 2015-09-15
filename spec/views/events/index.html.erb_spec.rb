require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :name => "Name",
        :description => "MyText",
        :keywords => "MyText",
        :facebook_event_link => "Facebook Event Link",
        :main_image => "Main Image",
        :slug => "Slug",
        :published => false,
        :archived => false
      ),
      Event.create!(
        :name => "Name",
        :description => "MyText",
        :keywords => "MyText",
        :facebook_event_link => "Facebook Event Link",
        :main_image => "Main Image",
        :slug => "Slug",
        :published => false,
        :archived => false
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Facebook Event Link".to_s, :count => 2
    assert_select "tr>td", :text => "Main Image".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
