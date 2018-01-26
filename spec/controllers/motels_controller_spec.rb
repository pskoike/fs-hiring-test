require 'rails_helper'

RSpec.describe MotelsController, type: :controller do

  before :each do
      user = User.create({
        email: 'jb@luvoltels.com',
        password: '123456'
        })
      sign_in user
  end

  describe "GET #index" do

    it "should have a current_user" do
      expect(subject.current_user).to_not eq(nil)
    end

    it "populates an array of motels" do
      get :index
      expect(assigns(:motels)).to match_array [motel]
    end

    it "renders the :index view"
  end

  describe "GET #show" do
    it "assigns the requested contact to @contact"
    it "renders the :show template"
  end

end
