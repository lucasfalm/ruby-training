# frozen_string_literal: true

def insert_into_bst(root, val)
  if !root
    [val]
  else
    if val >= root.val
      if root.right
        insert_into_bst(root.right, val)
      else
        root.right = TreeNode.new(val)
      end
    elsif root.left
      insert_into_bst(root.left, val)
    else
      root.left = TreeNode.new(val)
    end
    root
  end
end
