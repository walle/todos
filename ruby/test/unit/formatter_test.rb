require 'test_helper'

class FormatterTest < Test::Unit::TestCase

  def setup
    @items = [
      Todo::Comment.new('Todos'),
      Todo::Spacer.new,
      Todo::Task.new('Item 1', '2 hours', 'Low'),
      Todo::Task.new('Item 2'),
      Todo::Spacer.new,
      Todo::Task.new('Item 3', '', '', '2013-09-03 15:09:22 +0200')
    ]
    @subject = Todo::Formatter.new
  end

  def test_can_format_correctly
    expected = "\# Todos\n\n* Item 1 -!- 2 hours -!- Low\n* Item 2 -!-  -!- \n\n- Item 3 -!-  -!-  -!- 2013-09-03 15:09:22 +0200\n"
    assert_equal expected, @subject.format(@items)
  end
end