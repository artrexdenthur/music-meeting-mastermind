require 'test_helper'

class SingerTest < ActiveSupport::TestCase
  test "has a name" do
    singer = build(:singer)
    assert_equal("Joe Singer", singer.name)
  end

  test "can be associated with a chorus" do
    chorus = build(:chorus)
    singer = build(:singer)
  end

end
