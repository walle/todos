require 'test_helper'

class SpacerTest < Test::Unit::TestCase

  def setup
    @subject = Todo::Spacer.new
  end

  def test_outputs_valid_to_s
    expected = "\n"
    assert_equal expected, @subject.to_s
  end
end