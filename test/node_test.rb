require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test

  def test_node_knows_data
    node = Node.new("plop")
    assert_equal "plop", node.data
  end

  def test_next_node_is_nil_when_created
    node = Node.new(nil)
    assert_equal node.next_node, nil
  end


    def test_node_class_exists
      node = Node.new(nil)
        assert node
    end

    def test_it_returns_the_data
        node = Node.new("hello")
        assert_equal "hello", node.data
    end

    def test_the_next_node_returns_nil
        node = Node.new("hello")
        assert_equal nil, node.next_node
    end

    def test_we_can_change_next_node
      node = Node.new("hello")
      assert_equal nil, node.next_node
      assert_equal "hi", node.next_node = "hi"
    end


end
