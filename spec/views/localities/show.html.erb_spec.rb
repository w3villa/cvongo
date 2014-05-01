require 'spec_helper'

describe "localities/show" do
  before(:each) do
    @locality = assign(:locality, stub_model(Locality,
      :name => "Name",
      :city_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
  end
end
