def insert_into_bst(root, val)
    unless !root
        if val >= root.val
           if root.right
               insert_into_bst(root.right, val)
           else
               root.right = TreeNode.new(val)
           end
        else
            if root.left
                insert_into_bst(root.left, val)
            else
                root.left = TreeNode.new(val)
            end
        end
        return root
    else
        return [val]
    end
end