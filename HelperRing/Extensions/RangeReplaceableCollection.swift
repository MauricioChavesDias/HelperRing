//
//  RangeReplaceableCollection.swift
//  HelperRing
//
//  Created by Mauricio Dias on 24/10/2022.
//

import Foundation


extension RangeReplaceableCollection where Self: StringProtocol {
    
    // Remove all the non numeric characters from a string
    mutating func removeAllNonNumeric() {
        removeAll { !$0.isWholeNumber }
    }
    
}
