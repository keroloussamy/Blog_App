require 'rails_helper'

describe 'Authentication', type: :request do
  describe 'POST /authentication' do

    it 'authentication the client' do
      post '/api/authenticate', params: {email: 'keroloussamy98@gmail.com', password: '123456' }
      expect(response).to have_http_status(:created)
    end
  end
end
