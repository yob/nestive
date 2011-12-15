require 'test_helper'

class NestiveTest < ActiveSupport::TestCase

  test "appending a single string" do
    subject = NestiveHarness.new
    subject.append(:header, "1")
    assert_equal "1", subject.area(:header)
  end

  test "appending two strings" do
    subject = NestiveHarness.new
    subject.append(:header, "2")
    subject.append(:header, "1")
    assert_equal "12", subject.area(:header)
  end

  test "appending a string and a block" do
    subject = NestiveHarness.new
    subject.append(:header) do
      "2"
    end
    subject.append(:header, "1")
    assert_equal "12", subject.area(:header)
  end

  test "prepending a single string" do
    subject = NestiveHarness.new
    subject.prepend(:header, "1")
    assert_equal "1", subject.area(:header)
  end

  test "prepending two strings" do
    subject = NestiveHarness.new
    subject.prepend(:header, "2")
    subject.prepend(:header, "1")
    assert_equal "21", subject.area(:header)
  end

  test "prepending a string and a block" do
    subject = NestiveHarness.new
    subject.prepend(:header) do
      "2"
    end
    subject.prepend(:header, "1")
    assert_equal "21", subject.area(:header)
  end

  test "replacing a single string" do
    subject = NestiveHarness.new
    subject.replace(:header, "1")
    assert_equal "1", subject.area(:header)
  end

  test "replacing two strings" do
    subject = NestiveHarness.new
    subject.replace(:header, "2")
    subject.replace(:header, "1")
    assert_equal "2", subject.area(:header)
  end

  test "replacing a string and a block" do
    subject = NestiveHarness.new
    subject.replace(:header) do
      "2"
    end
    subject.replace(:header, "1")
    assert_equal "2", subject.area(:header)
  end

  test "extending a layout" do
    subject = NestiveHarness.new

    subject.append(:header, "foo")
    output = subject.extends(:application) do
      subject.area(:header) do
        "bar"
      end
    end
    assert_equal "barfoo", output
  end
end
