require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users/:id/posts' }

    it 'Correct Status' do
      expect(response).to have_http_status(:ok)
    end

    it 'Correct template' do
      expect(response).to render_template(:index)
    end

    it 'Correct Content' do
      expect(response.body).to include('Index')
    end
  end

  describe 'GET /show' do
    before(:example) { get '/users/:id/posts/:id' }

    it 'Correct Status' do
      expect(response).to have_http_status(:ok)
    end

    it 'Correct template' do
      expect(response).to render_template(:show)
    end

    it 'Correct Content' do
      expect(response.body).to include('Show')
    end
  end
end
