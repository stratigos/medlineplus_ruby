# Cover the most basic use cases of this tool.

RSpec.describe MedlineplusRuby do

  let!(:api_url)   { 'https://apps.nlm.nih.gov/medlineplus/services/mpconnect_service.cfm' }
  let!(:test_code) { 'J01.01' }
  let!(:bad_code)  { 'nerf' }

  before :all do
    WebMock.disable_net_connect! allow_localhost: true
  end

  after :all do
    WebMock.allow_net_connect!
  end

  it 'retrieves ICD-10 diagnosis code information' do
    
    stub_request(:get, api_url).
      with(query: hash_including({ 'mainSearchCriteria.v.c' => test_code })).
      to_return(status: 200, body:
        '{"feed":{"entry":[{
          "title": {"_value": "Sinusitis"},
          "link": [{"title": "Sinusitis", "href": "https://medlineplus.gov/sinusitis.html"}],
          "summary": {"_value": "Sinusitis means your sinuses are inflamed."}}]}}')

    result = MedlineplusRuby::Client.new.description_data_for_code test_code

    expect(result[:success]).to eq(true)
    expect(result[:data]).to eq [{
      title:'Sinusitis',
      link: 'https://medlineplus.gov/sinusitis.html',
      description: 'Sinusitis means your sinuses are inflamed.' }]

  end

end
