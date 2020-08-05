require 'rails_helper'

describe Dashboard::EventsController do
  render_views
    let(:current_user) {create(:user)}
  let(:event) {create(:event, user: current_user )}



  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:account]

    sign_in current_user, scope: :user
  end

  describe "index" do
    it "should respond" do
      get :index, xhr: true, format: 'js', params: {
          
      }
    end
  end

  describe "new" do
    it "should show form" do
      get :new, xhr: true, format: 'js', params: {
          
      }
    end
  end

  describe "create" do
    it "should create a new event" do
      expect {
        post :create, xhr: true, format: 'js', params: {
          
            event: {
                user_id: '124', name: 'Monkey', start_at: '2020-08-06 19:31:45 -0400', end_at: '2020-08-06 19:31:45 -0400', promote_on: '', description: 'Pony'
        }}
      }.to change { Event.all.count }.by(1)
      assert_response :ok
    end

    # it "should not create if there are errors" do
    #   post :create, xhr: true, format: 'js',  params: {id: event.id,
    #                                                    event: {skin_id: nil}}
    #
    #   expect(controller).to set_flash.now[:alert].to(/Oops, your event could not be saved/)
    # end
  end

  describe "edit" do
    it "should return an editable form" do
      get :edit, xhr: true, format: 'js',  params: {
          
          id: event.id
      }
      assert_response :ok
    end
  end

  describe "show" do
    it "should return a view form" do
      get :show, xhr: true, format: 'js',  params: {
          
          id: event.id
        }
      assert_response :ok
    end
  end

  describe "update" do
    it "should update" do
      put :update, xhr: true, format: 'js',
          params: {
            
            id: event.id,
            event: {
                user_id: '854', name: 'Mole', start_at: '2020-08-10 19:31:45 -0400', end_at: '2020-08-09 19:31:45 -0400', promote_on: '', description: 'Octopus'
            }}

      assert_response :ok
    end

    # it "should not update if invalid" do
    #   put :update, xhr: true, format: 'js',
    #       params: {
    #         id: event.id,
    #         event: {
    #           user_id: '819', name: 'Raccoon', start_at: '2020-08-09 19:31:45 -0400', end_at: '2020-08-06 19:31:45 -0400', promote_on: '', description: 'Monkey'
    #       }}
    #
    #   assert_response :ok
    #
    #   expect(controller).to set_flash.now[:alert].to(/Oops, your event could not be saved/)
    # end
  end

  describe "#destroy" do
    it "should destroy" do
      post :destroy, format: 'js', params: {
          
          id: event.id
      }
      assert_response :ok
      expect(Event.count).to be(0)
    end
  end
end

