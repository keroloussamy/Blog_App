require 'rails_helper'

describe AuthenticationTokenService do
  describe '.call' do

    it 'return an authentication toke' do
      token = described_class.call
      
      decoded_token = JWT.decode(
        token, 
        described_class::HMAC_SECRET,
        true, 
        { 
          algorithm: described_class::ALGORITHM_TYPE 
        }
      )

      expect(decoded_token).to eql(
        [
          {"test"=>"blah"}, # payload
          {"alg"=>"HS256"} # header
        ]
      )
    end
  end
end
