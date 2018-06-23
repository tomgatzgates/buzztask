require 'test_helper'

class ActiveRecordErrorSerializerTest < ActiveSupport::TestCase
  class SampleModel
    include ActiveModel::Model
    attr_accessor :foo, :bar
  end

  test 'returns an array of errors' do
    sample = SampleModel.new
    sample.errors.add(:foo, "can't be blank")
    json = ActiveRecordErrorSerializer.new(sample).serialized_json

    assert_equal Array, json.class
  end

  test 'includes source, code, title and detail with each error' do
    sample = SampleModel.new
    sample.errors.add(:foo, "can't be blank")
    json = ActiveRecordErrorSerializer.new(sample).serialized_json

    assert_equal %i(source code title detail).sort, json[0].keys.sort
  end

  test 'serialises source pointer as /data/attributes/[field]' do
    sample = SampleModel.new
    sample.errors.add(:foo, "can't be blank")
    json = ActiveRecordErrorSerializer.new(sample).serialized_json

    assert_equal '/data/attributes/foo', json[0][:source][:pointer]
  end
end
