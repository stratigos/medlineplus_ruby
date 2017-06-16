RSpec.describe MedlineplusRuby::API::ResponsePayload do

  subject { MedlineplusRuby::API::ResponsePayload.new }

  describe 'instance methods' do

    describe '#respond' do

      context 'when receiving expected NLM API response body' do

        let(:formatted_response) { subject.respond @api_response_body }

        it 'returns a success flag of TRUE' do
          expect(formatted_response[:success]).to eq(true)
        end

        it 'has no errors' do
          expect(formatted_response[:errors]).to be_empty
        end

        it 'assigns summary text' do
          expect(formatted_response[:data_requested]).to_not be_empty
        end

        it 'assigns data containing each description found' do
          expect(formatted_response[:data].size).to eq(1)
        end

        it 'assigns the raw result returned from the NLM API' do
          expect(formatted_response[:response_raw]).to_not be_empty
        end

      end

      context 'when receiving invalid input' do

        let(:formatted_response) { subject.respond '{garbage!}' }

        it 'returns a success flag of FALSE' do
          expect(formatted_response[:success]).to eq(false)
        end

        it 'has errors' do
          expect(formatted_response[:errors]).to_not be_empty
        end

      end

    end

  end

end
