require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :name => "Name",
      :description => "MyText",
      :keywords => "MyText",
      :facebook_event_link => "Facebook Event Link",
      :main_image => "Main Image",
      :slug => "Slug",
      :published => false,
      :archived => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Facebook Event Link/)
    expect(rendered).to match(/Main Image/)
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
