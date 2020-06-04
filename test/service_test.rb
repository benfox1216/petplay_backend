require_relative 'test_helper'

class ServiceTest < MiniTest::Test

  def setup
    json_response = File.read('test/fixtures/park_info_by_zip.json')
    stub_request(:get, "https://maps.googleapis.com/maps/api/place/textsearch/json").
        to_return(status: 200, body: json_response)
    @json = JSON.parse(json_response, symbolize_names: true)
  end

  def test_it_can_return_formatted_response
    assert_instance_of Array, @json
    @json.each do |park|
      assert_instance_of Hash, park
      park.each do |key, value|
        assert_equal value, park[key]
      end
    end
  end
end
