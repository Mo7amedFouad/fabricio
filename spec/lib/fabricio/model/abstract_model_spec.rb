require 'rspec'
require 'fabricio/models/abstract_model'
require 'fabricio/models/organization'

describe 'AbstractModel' do

  it 'should use json keys as methods' do
    test_value_1 = '1'
    test_value_2 = '2'
    test_json = {
        'key1' => test_value_1,
        'key2' => test_value_2
    }

    model = Fabricio::Model::AbstractModel.new
    model.json = test_json

    expect(model.key1).to eq(test_value_1)
    expect(model.key2).to eq(test_value_2)
  end

  it 'should throw exception when invalid method is called' do
    test_value_1 = '1'
    test_value_2 = '2'
    test_json = {
        'key1' => test_value_1,
        'key2' => test_value_2
    }

    model = Fabricio::Model::AbstractModel.new
    model.json = test_json

    expect {
      model.key3
    }.to raise_error(NoMethodError)
  end

  it 'should print its parameters' do
    model = Fabricio::Model::Organization.new({
        'id' => '1',
        'alias' => '2',
        'name' => '3',
        'apps_counts' => '4'
    })

    expect(model.pretty_print).to_not be_nil
  end
end