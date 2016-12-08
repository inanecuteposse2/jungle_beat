require_relative 'node'
class LinkedList
    attr_reader :head, :count

    def initialize
        @head = nil
        @count = 0
    end

    def append(word)
        node = Node.new(word)
        #def append calls add_node_to_list inside

        if @head.nil?
            @head = node
            @count += 1
            #if head empty do this
        else
            add_node_to_list(@head, node)
            #if head is not nil(empty) run this method
        end
        word
    end
# @head is equal to current_node first time around
    def add_node_to_list(current_node, new_node)
        if current_node.next_node.nil?
            current_node.next_node = new_node
            @count +=1
        else
            #this is recursion for the method,
            #using recursion to bring to end of link list
            add_node_to_list(current_node.next_node, new_node)
        end
    end



    def to_string
    current = @head
    captured_beats = []

    until current.next_node == nil
      captured_beats << current.data
      current = current.next_node #repeats, condition not met
    end
    captured_beats << current.data
    captured_beats.join(" ")
    end

    def prepend(data)
      node = Node.new(data)
      existing_head = @head #holding position
      node.next_node = existing_head
      @head = node
    end

    def insert(position, data)
      node = Node.new(data)
      current_node = @head
      index_count = 1

      until index_count == position #moving thru node until reaches position
       index_count += 1
       current_node = current_node.next_node
      end
        temporary = current_node.next_node

      current_node.next_node = node #created new node in 1 positon with data "dop"
      current_node.next_node.next_node = temporary
      data
    end

    def pop
      index_count = 0
      current_node = @head
      until current_node.next_node == nil
       index_count += 1
       current_node = current_node.next_node
      end

      current_node = @head
      position = 1
      until position == index_count-1
        current_node = current_node.next_node
      end
      current_node.next_node = nil


    end

    def includes?(data)
      to_string.include?(data)
    end




end
