require 'rails_helper'

RSpec.describe "boxes/show", type: :view do
  before(:each) do
    @box = assign(:box, Box.create!(
      :token => "",
      :user => nil,
      :title => "Title",
      :description => "MyText",
      :public => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end
