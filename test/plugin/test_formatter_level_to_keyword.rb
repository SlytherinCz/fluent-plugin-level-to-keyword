require 'fluent/test'
require 'fluent/test/driver/formatter'
require 'fluent/test/helpers'
require 'fluent/plugin/formatter_level_to_keyword'

class LevelToKeywordFormatterTest < Test::Unit::TestCase
  include Fluent::Test::Helpers

  setup do
    Fluent::Test.setup
  end

  def create_driver(conf={})
    Fluent::Test::Driver::Formatter.new(Fluent::Plugin::LevelToKeywordFormatter).configure(conf)
  end

  def create_formatter(conf={})
    create_driver(conf).instance
  end

  test "format a string 1 to alert" do
    formatter = create_formatter()
    formatted = formatter.format('test', Time.new, {"level" => "1"})
    assert_equal("alert", formatted["level"])
  end


  test "format an int 1 to alert" do
    formatter = create_formatter()
    formatted = formatter.format('test', Time.new, {"level" => 1})
    assert_equal("alert", formatted["level"])
  end


  test "format a string 999 to other" do
    formatter = create_formatter()
    formatted = formatter.format('test', Time.new, {"level" => "999"})
    assert_equal("other", formatted["level"])
  end


  test "leave a word untouched" do
    formatter = create_formatter()
    formatted = formatter.format('test', Time.new, {"level" => "some_word"})
    assert_equal("some_word", formatted["level"])
  end

  test "leave a nested object untouched" do
    formatter = create_formatter()
    formatted = formatter.format('test', Time.new, {"level" => {"nested" => "some_word"}})
    assert_equal({"nested" => "some_word"}, formatted["level"])
  end
end