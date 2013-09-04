require 'test_helper'

class CommentTest < Test::Unit::TestCase

  def setup
    @text = 'This is a comment'
    @subject = Todo::Comment.new(@text)
  end

  def test_sets_values_correctly
    assert_equal @text, @subject.text
  end

  def test_outputs_valid_to_s
    expected = "\# #{@text}\n"
    assert_equal expected, @subject.to_s
  end

  def test_text_is_striped
    expected = "\# test\n"
    comment = Todo::Comment.new('  test  ')
    assert_equal 'test', comment.text
    assert_equal expected, comment.to_s
  end
end