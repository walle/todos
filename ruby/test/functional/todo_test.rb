require 'test_helper'

require 'fileutils'
require 'stringio'

class TodoTest < Test::Unit::TestCase

  def setup
    @filename = 'tmp/items.todo'
    @contents = "\# Todos\n\n* Item 1 -!- 2 hours -!- Low\n* Item 2 -!-  -!- \n\n- Item 3 -!-  -!-  -!- 2013-09-03 15:09:22 +0200\n"
    @items = [
      Todo::Comment.new('Todos'),
      Todo::Spacer.new,
      Todo::Task.new('Item 1', '2 hours', 'Low'),
      Todo::Task.new('Item 2'),
      Todo::Spacer.new,
      Todo::Task.new('Item 3', '', '', '2013-09-03 15:09:22 +0200')
    ]
    FileUtils.mkdir 'tmp'
    File.open(@filename, "w") { |file| file.write(@contents) }
  end

  def teardown
    FileUtils.rm_rf 'tmp'
  end

  def test_can_parse_file
    assert_equal @items.length, Todo.parse(@filename).length
  end

  def test_can_save_items
    expected = "* Item 1 -!- 2 hours -!- Low\n"
    Todo.save(@filename, [Todo::Task.new('Item 1', '2 hours', 'Low')])
    assert_equal expected, File.read(@filename)
  end

  def test_can_output_all_tasks
    expected = "Open tasks\n\n  Identifier: Item 1\n  Estimated time: 2 hours\n  Priority: Low\n\n  Identifier: Item 2\n\nCompleted tasks\n\n  - Item 3 [2013-09-03 15:09:22 +0200]\n"
    output = capture_stdout { Todo.show(@filename) }
    assert_equal expected, output
  end

  def test_can_add_task
    old_length = Todo.parse(@filename).length
    Todo.add @filename, Todo::Task.new('New item')
    assert_equal old_length + 1, Todo.parse(@filename).length
  end

  def test_can_complete_task
    old_length = Todo::List.new(Todo.parse(@filename)).completed.length
    Todo.complete @filename, 'Item 1'
    assert_equal old_length + 1, Todo::List.new(Todo.parse(@filename)).completed.length
  end

  def test_can_delete_task
    old_length = Todo.parse(@filename).length
    Todo.delete @filename, 'Item 1'
    assert_equal old_length - 1, Todo.parse(@filename).length
  end

  def test_can_update_task
    expected = "* Updated item -!- 2 hours -!- Low\n"
    Todo.save(@filename, [Todo::Task.new('Item 1', '2 hours', 'Low')])
    Todo.update @filename, 'Item 1', 'Updated item'
    assert_equal expected, File.read(@filename)
  end

  def test_outputs_error_message_if_task_doesnt_exist_when_deleting
    old_length = Todo.parse(@filename).length
    output = capture_stdout { Todo.delete @filename, 'non existing identifier' }
    assert_equal old_length, Todo.parse(@filename).length
    assert_equal "The task \"non existing identifier\" does not exist\n", output
  end

  def test_outputs_error_message_if_task_doesnt_exist_when_updating
    output = capture_stdout { Todo.update @filename, 'non existing identifier', 'Updated item' }
    assert_equal "The task \"non existing identifier\" does not exist\n", output
  end

  def test_outputs_error_message_if_task_doesnt_exist_when_completing
    output = capture_stdout { Todo.complete @filename, 'non existing identifier' }
    assert_equal "The task \"non existing identifier\" does not exist\n", output
  end

  def capture_stdout(&block)
    original_stdout = $stdout
    $stdout = fake = StringIO.new
    begin
      yield
    ensure
      $stdout = original_stdout
    end
    fake.string
  end
end