require 'spec_helper'

describe "localities/new" do
  before(:each) do
    assign(:locality, stub_model(Locality,
      :name => "MyString",
      :city_id => 1
    ).as_new_record)
  end

  it "renders new locality form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", localities_path, "post" do
      assert_select "input#locality_name[name=?]", "locality[name]"
      assert_select "input#locality_city_id[name=?]", "locality[city_id]"
    end
  end
end
