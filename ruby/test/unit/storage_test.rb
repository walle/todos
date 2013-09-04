require 'test_helper'

class StorageTest < Test::Unit::TestCase

  def setup
    @filename = '/tmp/items.todo'
    @contents = "\# Todos\n\n* Item 1 -!- 2 hours -!- Low\n* Item 2 -!-  -!- \n\n- Item 3 -!-  -!-  -!- 2013-09-03 15:09:22 +0200\n"
    @items = [
      Todo::Comment.new('Todos'),
      Todo::Spacer.new,
      Todo::Task.new('Item 1', '2 hours', 'Low'),
      Todo::Task.new('Item 2'),
      Todo::Spacer.new,
      Todo::Task.new('Item 3', '', '', '2013-09-03 15:09:22 +0200')
    ]
    @subject = Todo::Storage.new
  end

  def test_can_load_file
    stub(File).read(@filename) { @contents }
    assert_equal @contents, @subject.load(@filename)
  end

  def test_can_write_file
    mock(File).open(@filename, 'w') { $stdout }
    assert_equal @contents, @subject.save(@filename, @items, Todo::Formatter.new)
  end

  def test_creates_file_if_it_doesnt_exist
    mock(File).exists?(@filename) { false }
    mock(File).open(@filename, 'w') { $stdout }
    assert_equal '', @subject.load(@filename)
  end
end