RSpec.describe MedlineplusRuby::Client do

  describe 'instance methods' do

    describe '#description_data_for_code' do

      let(:formatted_response) { 'you win' }
      let(:medline_client)     { instance_double MedlineplusRuby::Client }

      it 'accepts a code and fetches a response' do
        allow(medline_client).to receive(:description_data_for_code).and_return(formatted_response)

        expect(medline_client.description_data_for_code(@test_code)).to eq(formatted_response)
      end

    end

  end

end
