require 'rails_helper'

RSpec.describe "boxes/index", type: :view do
  before(:each) do
    assign(:boxes, [
      Box.create!(
        :token => "",
        :user => nil,
        :title => "Title",
        :description => "MyText",
        :public => false
      ),
      Box.create!(
        :token => "",
        :user => nil,
        :title => "Title",
        :description => "MyText",
        :public => false
      )
    ])
  end

  it "renders a list of boxes" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
