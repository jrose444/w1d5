require "byebug"

class PolyTreeNode
  attr_reader :parent, :children, :value
  
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(new_parent=nil)
    unless parent == nil 
      @parent.children.delete(self) if @parent.children.include?(self)
    end
    
    unless new_parent == nil
      @parent = new_parent
      @parent.children << self unless @parent.children.include?(self)
    else
      @parent.children.delete(self)
      @parent = nil
    end
  end

  def add_child(new_child)
    #hey new child do all the paperwork!
    new_child.parent=self
  end

  def remove_child(not_child)
    #get out of the house!
    not_child.parent=nil
  end

  def dfs(target_value)

    # base cases
    return value if value == target_value
    return nil if children.empty?
    
    # inductive step
    debugger
    dfs_memo = []

    children.each do |child|

      dfs_memo << child.dfs(target_value) #if target_value == child.value

    end
      return nil
  end

  def inspect
    "value = #{self.value}, parent = #{self.parent}, children = #{self.children}"
  end

end