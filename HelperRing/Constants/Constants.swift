//
//  Constants.swift
//  HelperRing
//
//  Created by Mauricio Dias on 18/10/2022.
//

import Foundation
import UIKit

struct Constants {
    
    static func isThereAnyPhotoInTheAssets(imageName: String) -> Bool {
        guard UIImage(named: imageName) != nil else { return false }
        return true
    }

}
