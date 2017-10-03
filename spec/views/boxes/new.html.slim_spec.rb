require 'rails_helper'

RSpec.describe "boxes/new", type: :view do
  before(:each) do
    assign(:box, Box.new(
      :token => "",
      :user => nil,
      :title => "MyString",
      :description => "MyText",
      :public => false
    ))
  end

  it "renders new box form" do
    render

    assert_select "form[action=?][method=?]", boxes_path, "post" do

      assert_select "input[name=?]", "box[token]"

      assert_select "input[name=?]", "box[user_id]"

      assert_select "input[name=?]", "box[title]"

      assert_select "textarea[name=?]", "box[description]"

      assert_select "input[name=?]", "box[public]"
    end
  end
end
