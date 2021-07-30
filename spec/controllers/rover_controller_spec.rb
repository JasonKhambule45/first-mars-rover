require 'rails_helper'

RSpec.describe RoversController, type: :controller do
  let(:rover)  {create(:rover)}

  describe 'POST rovers' do
    before do
      post :create,  :params => { :rover => {name: "Jason", org: "NASA", x_axis: 0, y_axis: 0, plateau_x_axis: 5, plateau_y_axis: 5}}
    end

    it 'should create rover' do
      expect(response ).to have_http_status(:found)
    end
  end

  describe 'GET rover' do
    before do
      get :show, params: {id: rover.id}
    end

    it 'should get the rover' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'Instruct rover movements' do
    before do
      post :instruction, params: {instruction: "MRM", id: rover.id}
    end

    it 'should move rover in appropriate direction forward' do
      rover.reload
      expect(rover.x_axis).to eq(1)
    end

    it 'should move rover in appropriate direction forward' do
      rover.reload
      expect(rover.y_axis).to eq(1)
    end

    it 'should move rover to face appropriate direction' do
      rover.reload
      expect(rover.direction).to eq("E")
    end
  end
end