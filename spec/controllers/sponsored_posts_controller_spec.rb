require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do


let(:my_sponsoredpost) { SponsoredPost.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 10) }


  describe "GET #show" do
    it "returns http success" do
      get :show, {id: my_sponsoredpost.id}
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
      get :show, {id: my_sponsoredpost.id}
      expect(my_sponsoredpost).to render_template :show
    end
    it "assigns my_sponsoredpost to @sponsoredpost" do
      get :show, {id: my_sponsoredpost.id}
      expect(assigns(:sponsoredpost)).to eq my_sponsoredpost
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it "renders the #new template" do
      get :new
      expect(response).to render_template :new
    end
    it "initializes @sponsoredpost" do
      get :new
      expect(assigns(:sponsoredpost)).not_to be_nil
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, {id: my_sponsoredpost.id}
      expect(response).to have_http_status(:success)
    end
    it "renders the #edit view" do
      get :edit, {id: my_sponsoredpost.id}
      expect(response).to render_template :edit
    end
    it "assigns sponsoredpost to be updated to @sponsoredpost" do
      get :edit, {id: my_sponsoredpost.id}
      instance = assigns(:sponsoredpost)
      expect(instance.id).to eq my_sponsoredpost.id
      expect(instance.title).to eq my_sponsoredpost.title
      expect(instance.body).to eq my_sponsoredpost.body
      expect(instance.price).to eq my_sponsoredpost.price
    end
  end

end
