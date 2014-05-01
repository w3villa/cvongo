require 'spec_helper'

describe "societies/edit" do
  before(:each) do
    @society = assign(:society, stub_model(Society,
      :name => "MyString",
      :locality_id => 1
    ))
  end

  it "renders the edit society form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", society_path(@society), "post" do
      assert_select "input#society_name[name=?]", "society[name]"
      assert_select "input#society_locality_id[name=?]", "society[locality_id]"
    end
  end
end
