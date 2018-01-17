//
//  6_ReConstructBinaryTree.swift
//  CodeInterviews
//
//  Created by guxuan on 17/01/2018.
//  Copyright © 2018 gu. All rights reserved.
//

import Foundation

enum Order {
    case PreOrder
    case InOrder
    case PostOrder
}

class BinaryNode<T> {
    var value: T
    var leftNode: BinaryNode<T>?
    var rightNode: BinaryNode<T>?
    
    init(value: T) {
        self.value = value
    }
    
    class func constructTreeWith(preOrder: [Int], inOrder: [Int]) -> BinaryNode<Int>? {
        if preOrder.count == 0 {
            return nil
        } else {
            let rootNode = BinaryNode<Int>(value: preOrder[0])
            let rootValue = rootNode.value
            let index = inOrder.index(of: rootValue)
            
            if let index = index {
                let leftPreOrder = Array(preOrder[1 ..< 1 + index])
                let leftInOrder = Array(inOrder[0 ..< index])
                let rightPreOrder = Array(preOrder[1 + index ..< preOrder.count])
                let rightInOrder = Array(inOrder[index + 1 ..< inOrder.count])
                rootNode.leftNode = constructTreeWith(preOrder: leftPreOrder, inOrder: leftInOrder)
                rootNode.rightNode = constructTreeWith(preOrder: rightPreOrder, inOrder: rightInOrder)
            }
            
            return rootNode
        }
    }
    
    class func traverseWith(order: Order, rootNode: BinaryNode<Int>) {
        switch order {
        case .PreOrder:
            preOrderTraverse(rootNode: rootNode)
        case .InOrder:
            inOrderTraverse(rootNode: rootNode)
        case .PostOrder:
            postOrderTraverse(rootNode: rootNode)
        }
    }
    
    class func preOrderTraverse(rootNode: BinaryNode<Int>) {
        print(rootNode.value)
        if let leftNode = rootNode.leftNode {
            preOrderTraverse(rootNode: leftNode)
        }
        
        if let rightNode = rootNode.rightNode {
            preOrderTraverse(rootNode: rightNode)
        }
    }
    
    class func inOrderTraverse(rootNode: BinaryNode<Int>) {
        if let leftNode = rootNode.leftNode {
            preOrderTraverse(rootNode: leftNode)
        }
        
        print(rootNode.value)
        
        if let rightNode = rootNode.rightNode {
            preOrderTraverse(rootNode: rightNode)
        }
    }
    
    class func postOrderTraverse(rootNode: BinaryNode<Int>) {
        if let leftNode = rootNode.leftNode {
            preOrderTraverse(rootNode: leftNode)
        }
        
        if let rightNode = rootNode.rightNode {
            preOrderTraverse(rootNode: rightNode)
        }
        
        print(rootNode.value)
    }
    
    class func test() {
        let preOrder = [1, 2, 4, 7, 3, 5, 6, 8]
        let inOrder = [4, 7, 2, 1, 5, 3, 8, 6]
        
        let root = BinaryNode.constructTreeWith(preOrder: preOrder, inOrder: inOrder)
        
        if let root = root {
            traverseWith(order: Order.PreOrder, rootNode: root)
        }
    }
}


