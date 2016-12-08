require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'
require './lib/node'
require 'pry'

class LinkedListTest < Minitest::Test
    def test_class_exists
        assert LinkedList
    end

    def test_head_is_nil_when_initialized
        list = LinkedList.new
        assert_equal nil, list.head
    end

    def test_append_returns_some_data
        list = LinkedList.new
        assert_equal "doop", list.append("doop")
    end

    def test_append_returns_some_other_data

        list = LinkedList.new
        assert_equal "beep", list.append("beep")
    end

    def test_appends_a_node_as_the_head_if_head_is_empty
        list = LinkedList.new
        list.append("doop")
        assert list.head
        assert_equal "doop", list.head.data
    end

    def test_the_lists_head_has_no_next_node
        list = LinkedList.new
        list.append("doop")
        assert_equal nil, list.head.next_node
    end

    def test_can_append_two_nodes_to_list
        list = LinkedList.new
        list.append("doop")
        list.append("beep")
        assert_equal "doop", list.head.data
        assert_equal "beep", list.head.next_node.data
    end

    def test_can_append_three_nodes_to_list
        list = LinkedList.new
        list.append("doop")
        list.append("beep")
        list.append("dooooop") #next node of this is nil-tail
        assert_equal "doop", list.head.data
        assert_equal "beep", list.head.next_node.data
        assert_equal "dooooop", list.head.next_node.next_node.data
    end

    def test_can_count_nodes
      list = LinkedList.new
      list.append("doop")
      list.append("beep")
      list.append("dooooop")
      assert_equal 3, list.count
    end

    def test_can_create_string_with_beats
      list = LinkedList.new
      list.append("doop")
      list.append("beep")
      assert_equal "doop beep", list.to_string
    end

    def test_it_can_prepend_data_to_list
      list = LinkedList.new
      list.append("doop")
      list.append("suu")
      list.prepend("dop")
      list.prepend("zoom")
      # binding.pry
      assert_equal "zoom dop doop suu", list.to_string
    end

    def test_it_can_insert_data_to_given_position_in_list
      list = LinkedList.new
      list.append("doop")
      list.append("suu")
      list.append("zoom")
      # binding.pry
      assert_equal "dop", list.insert(1, "dop")
      assert_equal 3, list.count
      assert_equal "doop dop suu zoom", list.to_string
    end

    def test_can_remove_data_from_list
      skip
      list = LinkedList.new
      list.append("deep")
      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.append("blop")
      assert_equal "blop", list.pop
    end

    def test_data_can_be_included_in_list
      list = LinkedList.new
      list.append("deep")
      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.append("blop")
      assert list.includes?("deep")
      refute list.includes?("zoom")
    end

end
