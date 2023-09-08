//
//  AppImage.swift
//  AppHotel
//
//  Created by Ravil on 06.09.2023.
//

import Foundation
import UIKit

protocol AppImageProtocol {
    var rawValue: String { get }
}

extension AppImageProtocol {

    var uiImage: UIImage? {
        guard let image = UIImage(named: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }
    
    var systemImage: UIImage? {
        guard let image = UIImage(systemName: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }
    
}

enum AppImage: String, AppImageProtocol {
    case hotel
    case hotel1
    case hotel2
    case star
    case emojihappy
    case ticksquare
    case closesquare
    case vectorsquare
    case vectorBlue
}
