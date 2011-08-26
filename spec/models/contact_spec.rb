require 'spec_helper'

describe Contact do
  describe "attributes" do
    let(:contact) {Contact.new(:name => "J Walter Weatherman", :age => 51, :email => "thats_why_you@bluthcompany.com") }

    it "has attributes" do
      contact.name.should == "J Walter Weatherman"
      contact.age.should == 51
      contact.email.should == "thats_why_you@bluthcompany.com"
    end

    it "requires name" do
      invalid = Contact.new(:age => 51)
      invalid.should_not be_valid
    end

  end
end
