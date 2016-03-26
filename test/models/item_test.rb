require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "Match Created!" do
    @item1 = items(:one)
    @item2 = items(:two)
  end
end
