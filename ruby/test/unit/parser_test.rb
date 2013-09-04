require 'test_helper'

class ParserTest < Test::Unit::TestCase

  def setup
    @identifier = 'Item 1'
    @estimated_time = '5 hours'
    @priority = 'Urgent'
    @time = Time.parse('2013-09-03 15:09:22 +0200')
    @task = Todo::Task.new(@identifier, @estimated_time, @priority)
    @subject = Todo::Parser.new
  end

  def test_can_parse_open_task
    task = @subject.parse("* #{@identifier} -!- #{@estimated_time} -!- #{@priority}").first
    assert_equal @task.identifier, task.identifier
    assert_equal @task.estimated_time, task.estimated_time
    assert_equal @task.priority, task.priority
  end

  def test_can_parse_open_task_with_only_identifier
    task = @subject.parse("* #{@identifier} -!- -!- ").first
    assert_equal @task.identifier, task.identifier
    task = @subject.parse("* #{@identifier}").first
    assert_equal @task.identifier, task.identifier
  end

  def test_can_parse_comment
    assert_equal 1, @subject.parse('# this is a comment').length
    assert_equal 'this is a comment', @subject.parse('# this is a comment').first.text
    assert_equal "\# this is a comment\n", @subject.parse('# this is a comment').first.to_s
  end

  def test_can_parse_random_text
    assert_equal 4, @subject.parse("\n \# Comment \n\n this is just text").length
  end

  def test_can_parse_completed_task
    task = @subject.parse("- #{@identifier} -!- #{@estimated_time} -!- #{@priority} -!- #{@time}").first
    assert_equal @task.identifier, task.identifier
    assert_equal @task.estimated_time, task.estimated_time
    assert_equal @task.priority, task.priority
    assert_equal true, task.completed?
    assert_equal @time, task.completed_at
  end

  def test_can_parse_multiple_tasks
    assert_equal 5, @subject.parse("\n \# Comment \n\n * Item 1 -!- -!- \n - Item 2 -!- 3 minutes -!- Low -!- #{@time}").length
  end
end