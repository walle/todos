require 'test_helper'

class ListTest < Test::Unit::TestCase

  def setup
    @parsed_result = [Todo::Task.new('Item 1'), Todo::Task.new('Item 2'), Todo::Task.new('Item 3', '', '', Time.now.to_s)]
    @subject = Todo::List.new(@parsed_result)
  end

  def test_has_correct_number_of_tasks
    assert_equal 3, @subject.tasks.length
  end

  def test_has_correct_number_of_open_tasks
    assert_equal 2, @subject.open.length
  end

  def test_has_correct_number_of_completed_tasks
    assert_equal 1, @subject.completed.length
  end

  def test_can_add_task
    @subject.add Todo::Task.new('New item')
    @subject.add Todo::Task.new('New completed item', '', '', Time.now)
    assert_equal 5, @subject.tasks.length
    assert_equal 3, @subject.open.length
    assert_equal 2, @subject.completed.length
    assert_equal 5, @subject.items.length
  end

  def test_can_find_task_by_identifier
    assert_equal @parsed_result[1], @subject.find('Item 2')
  end

  def test_can_find_task_by_identifier_regex
    assert_equal @parsed_result[2], @subject.find(/3$/)
  end

  def test_can_find_task_by_identifier_string_containing_regex
    assert_equal @parsed_result[0], @subject.find('1$')
  end

  def test_can_delete_task
    @subject.delete 'Item 1'
    @subject.delete 'Item 3'
    assert_equal 1, @subject.tasks.length
    assert_equal 1, @subject.open.length
    assert_equal 0, @subject.completed.length
    assert_equal 1, @subject.items.length
  end

  def test_can_update_task
    @subject.update 'Item 1', 'Updated id', '', 'High'
    assert_equal 'Updated id', @subject.find('Updated id').identifier
    assert_equal '', @subject.find('Updated id').estimated_time
    assert_equal 'High', @subject.find('Updated id').priority
  end

  def test_find_returns_nil_if_no_hit
    assert_nil @subject.find('non existing identifier')
  end

  def test_delete_returns_error_mesage_if_task_doesnt_exist
    assert_equal 'The task "non existing identifier" does not exist', @subject.delete('non existing identifier')
  end

  def test_update_returns_error_mesage_if_task_doesnt_exist
    assert_equal 'The task "non existing identifier" does not exist', @subject.update('non existing identifier', 'Updated id', '', 'High')
  end
end