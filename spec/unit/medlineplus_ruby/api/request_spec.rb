RSpec.describe MedlineplusRuby::API::Request do

  subject { MedlineplusRuby::API::Request.build }

  it { expect( subject.class.const_defined?(:API_URI) ).to eq(true) }
  it { expect( subject.class::API_URI.frozen? ).to eq(true) }
  it { expect( subject.class::API_URI.to_s ).to eq(@api_url) }

  describe 'class methods' do

    describe '#build' do

      it 'creates an instance of self' do
        expect(subject.class).to eq(MedlineplusRuby::API::Request)
      end

      it 'injects its dependency on a response formatting object' do
        expect(defined? subject.response_payload).not_to be_nil
      end

    end

  end

  describe 'instance methods' do

    let(:formatted_response) {
      '{:success=>true,
        :errors=>[],
        :data_requested=>"MedlinePlus Connect results for ICD-10-CM J01.01",
        :data=>
          [{:title=>"Sinusitis",
            :link=>"https://medlineplus.gov/sinusitis.html",
            :description=>
            "<p>Sinusitis means your sinuses are inflamed.</p>"}],
        :response_raw=>"{}"'
    }

    describe '#get_request' do

      context 'when called with valid parameters' do

        let(:medline_request) { instance_double('MedlineplusRuby::API::Request') }

        it 'does things' do
          allow(medline_request).to receive(:get_request).and_return(formatted_response)

          expect(medline_request.get_request(@api_query_params)).to eq(formatted_response)
        end

      end

    end

  end

end
