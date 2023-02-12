class ATree
  attr_accessor :node_name, :children
  
  def initialize(name, tree={})
    @children = []
    @node_name = name

    tree.each do |key, value|
      @children.push(
        ATree.new(key, value)
      )
    end 
  end
  
  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end
  
  def visit(&block)
    block.call self
  end
end

the_tree = ATree.new("Root", {'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {},
'child 4' => {} } } })

puts "Visiting a node"
the_tree.visit {|node| puts node.node_name}

puts "visiting entire tree"
the_tree.visit_all {|node| puts node.node_name}










