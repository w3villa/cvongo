require 'spec_helper'

describe "localities/edit" do
  before(:each) do
    @locality = assign(:locality, stub_model(Locality,
      :name => "MyString",
      :city_id => 1
    ))
  end

  it "renders the edit locality form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", locality_path(@locality), "post" do
      assert_select "input#locality_name[name=?]", "locality[name]"
      assert_select "input#locality_city_id[name=?]", "locality[city_id]"
    end
  end
end
