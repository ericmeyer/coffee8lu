require 'spec_helper'

describe ContactsController do
  describe "index" do
    it "gets all contacts" do
      contact1, contact2 = mock_model(Contact), mock_model(Contact)
      Contact.should_receive(:all).and_return([contact1, contact2])
      get :index
      assigns(:contacts).should == [contact1, contact2]
    end
  end

  describe "show" do
    it "gets the specified contact" do
      contact = mock_model(Contact)
      Contact.should_receive(:find).with(1).and_return(contact)
      get :show, :id => 1
      assigns(:contact).should == contact
    end
  end

  describe "new" do
    it "news up a contact" do
      get :new
      assigns(:contact).should be_a_new Contact
    end
  end

  describe "create" do
    context "valid" do
      let(:attributes) { {:name => "Walter Weatherman"} }

      it "saves to database" do
        post :create, :contact => attributes
        assigns(:contact).id.should_not be_nil
      end

      it "redirects to the contact" do
        post :create, :contact => attributes
        response.should redirect_to assigns(:contact)
      end
    end

    context "invalid" do
      let(:attributes) { {:age => 51} }

      it "does not save to the database" do
        post :create, :contact => attributes
        assigns(:contact).should be_a_new Contact
      end

      it "renders the new action again" do
        post :create, :contact => attributes
        response.should render_template 'new'
      end
    end
  end

  describe "edit" do
    let(:contact) { mock_model(Contact) }

    it "gets the specified contact" do
      Contact.should_receive(:find).with(1).and_return(contact)
      get :show, :id => 1
      assigns(:contact).should == contact
    end
  end

  describe "update" do
    let(:attributes) { {:name => "Gene Parmesan"} }
    let(:contact) { mock_model(Contact) }

    context "valid" do
      it "updates the contact" do
        Contact.should_receive(:find).with(1).and_return(contact)
        contact.should_receive(:update_attributes).and_return(true)
        put :update, :id => 1, :contact => attributes
        response.should redirect_to contact
      end
    end

    context "invalid" do
      it "updates the contact" do
        Contact.should_receive(:find).with(1).and_return(contact)
        contact.should_receive(:update_attributes).and_return(false)
        put :update, :id => 1, :contact => attributes
        response.should render_template "edit"
      end
    end
  end

  describe "destroy" do
    let(:contact) { mock_model(Contact) }

    it "gets the specified contact" do
      Contact.should_receive(:find).with(1).and_return(contact)
      contact.should_receive(:destroy)
      delete :destroy, :id => 1
      response.should redirect_to contacts_path
    end
  end
end
