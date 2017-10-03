require 'rails_helper'

RSpec.describe "boxes/edit", type: :view do
  before(:each) do
    @box = assign(:box, Box.create!(
      :token => "",
      :user => nil,
      :title => "MyString",
      :description => "MyText",
      :public => false
    ))
  end

  it "renders the edit box form" do
    render

    assert_select "form[action=?][method=?]", box_path(@box), "post" do

      assert_select "input[name=?]", "box[token]"

      assert_select "input[name=?]", "box[user_id]"

      assert_select "input[name=?]", "box[title]"

      assert_select "textarea[name=?]", "box[description]"

      assert_select "input[name=?]", "box[public]"
    end
  end
end
