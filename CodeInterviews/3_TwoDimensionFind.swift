//
//  TwoDimensionFind.swift
//  CodeInterviews
//
//  Created by guxuan on 15/01/2018.
//  Copyright © 2018 gu. All rights reserved.
//

import Foundation

class TwoDimensionFind {
    
    var arr: [[Int]]
    
    init(_ arr: [[Int]]) {
        self.arr = arr
    }
    
    func contains(key: Int) -> Bool {
        for rowVec in arr {
            if (binarySearch(vec: rowVec, key: key)) {
                return true
            }
        }
        
        return false
    }
    
    func binarySearch(vec: [Int], key: Int) -> Bool {
        let column = vec.count
        
        if key < vec[0] || key > vec[column - 1] {
            return false
        }
        
        var start = 0
        var end = column - 1
        var mid = (end + start) / 2
        while key != vec[mid] && start <= end {
            if key > vec[mid] {
                start = mid + 1
            } else {
                end = mid - 1
            }
            mid = (end + start) / 2
        }
        
        if key == vec[mid] {
            return true
        }
        
        return false
    }
    
    
    class func test() {
        let testData = [[1, 2, 8, 9], [2, 4, 9, 12], [4, 7, 10, 13], [6, 8, 11, 15]]
        
        let testInstance = TwoDimensionFind(testData)
        
        print(testInstance.contains(key: 10));
    }
}
