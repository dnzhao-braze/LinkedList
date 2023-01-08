class LinkedList
  attr_accessor :head, :tail
  def initiallize(head=nil, tail=nil)
    @head = head
    @tail = tail
  end

  def append(value)
    node = Node.new(value)
    if @head == nil
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
  end

  def prepend(value)
    node = Node.new(value)
    if @head == nil
      @head = node
      @tail = node
    else
      node.next_node = @head
      @head = node
    end
  end

  def size
    node = @head
    if node == nil
      0
    else
      size = 1
      while node.next_node != nil
        size += 1
        node = node.next_node
      end
      size
    end
  end

  def at(index)
    node = @head
    if node == nil || index >= size || index < 0
      nil
    else
      index.times {
        node = node.next_node
      }
      node.value
    end
  end

  def pop
    node = @head
    if node == nil
      nil
    elsif node.next_node == nil
      @head = nil
      @tail = nil
      node
    else
      prev = node
      node = node.next_node
      while node.next_node != nil
        prev = node
        node = node.next_node
      end
      prev.next_node = nil
      @tail = prev
      node
    end
  end

  def contains?(value)
    node = @head
    if node == nil
      return false
    else
      if node.value == value
        return true
      else
        while node.next_node != nil
          node = node.next_node
          if node.value == value
            return true
          end
        end
        return false
      end
    end
  end

  def find(value)
    if self.contains?(value)
      index = 0
      node = @head
      if node.value == value
        return index
      else
        while node.next_node != nil
          node = node.next_node
          index += 1
          if node.value == value
            return index
          end
        end
      end
    else
      return nil
    end
  end

  def to_s
    string = ""
    node = @head
    if node == nil
      string += "nil"
    else
      string += "( #{node.value} ) -> "
      while node.next_node != nil
        node = node.next_node
        string += "( #{node.value} ) -> "
      end
      string += "nil"
    end
    string
  end

  def insert_at(value,index)
    node = @head
    if index > size || index < 0
      nil
    elsif node == nil || index == 0
      self.prepend(value)
    elsif index == size
      self.append(value)
    else
      prev = nil
      index.times {
        prev = node
        node = node.next_node
      }
      new_node = Node.new(value, node)
      prev.next_node = new_node
    end
  end

  def remove_at(index)
    node = @head
    if index >= size || index < 0
      nil
    elsif index == size-1
      self.pop
    elsif index == 0
      @head = node.next_node
      node
    else
      prev = nil
      index.times {
        prev = node
        node = node.next_node
      }
      prev.next_node = node.next_node
      node
    end
  end
end

class Node
  attr_accessor :value, :next_node
  def initialize(value=nil, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new
list.append(0)
list.append(1)
list.append(2)
list.append(3)