class Node
  attr_accessor :value, :next_node
  def initialize(value=nil, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_reader :size, :head
  def initialize()
    @head = nil
    @size = 0
  end

  def append(value)
    if @head == nil
      @head = Node.new(value)
    else
      new_node = Node.new(value)

      self.tail.next_node = new_node
    end

    @size += 1
  end

  def prepend(value)
    @head = Node.new(value, @head)

    @size += 1
  end

  def tail
    tail_node = @head
    until tail_node.next_node == nil
      tail_node = tail_node.next_node
    end
    
    tail_node
  end

  def at(index)
    result = @head
    while index > 0
      result = result.next_node
      index -= 1
    end

    result
  end

  def pop()
    if self.size == 1
      @head = nil
    else
      self.at(self.size - 2).next_node = nil
    end

    @size -= 1
  end

  def contain?(value)
    node_to_check = @head

    until node_to_check == self.tail
      if node_to_check.value == value
        return true
      else
        node_to_check = node_to_check.next_node
      end
    end

    node_to_check.value == value
  end

  def find(value)
    node_to_find = @head
    index = 0

    until node_to_find == self.tail
      if node_to_find.value == value
        return index
      else
        node_to_find = node_to_find.next_node
        index += 1
      end
    end

    node_to_find.value == value ? index : nil
  end

  def to_s
    list_to_print = []
    node_to_print = @head
    until node_to_print == self.tail
      str = "( #{node_to_print.value} )"
      list_to_print << str
      node_to_print = node_to_print.next_node
    end 

    list_to_print.push("( #{node_to_print.value} )", "nil")

    list_to_print.join(" -> ")
  end

  def insert_at(value, index)
    if index == 0
      self.prepend(value)
    elsif index >= self.size
      self.append(value)
    else 
      insert_node = Node.new(value, self.at(index))
      self.at(index - 1).next_node = insert_node
      @size += 1
    end
  end

  def remove_at(index)
    if index == 0
      @head = @head.next_node
    else
      self.at(index - 1).next_node = self.at(index + 1)
    end
          
    @size -= 1
  end
end
