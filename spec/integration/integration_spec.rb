# Cover the most basic use cases of this tool.

RSpec.describe MedlineplusRuby do

  before :all do
    WebMock.disable_net_connect! allow_localhost: true
  end

  after :all do
    WebMock.allow_net_connect!
  end

  it 'retrieves ICD-10 diagnosis code information' do

    stub_request(:get, @api_url).
      with(query: hash_including({ @api_query_param => @test_code })).
      to_return(status: 200, body: @api_response_body)

    result = MedlineplusRuby::Client.new.description_data_for_code @test_code

    expect(result[:success]).to eq(true)
    expect(result[:data]).to eq [{
      title:'Sinusitis',
      link: 'https://medlineplus.gov/sinusitis.html',
      description: 'Sinusitis means your sinuses are inflamed.' }]

  end

end
