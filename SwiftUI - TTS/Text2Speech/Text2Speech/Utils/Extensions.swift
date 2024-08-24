//
//  Extensions.swift
//  Text2Speech
//
//  Created by Shadat Mufakhkhar Tonmoy on 24/8/24.
//

import Foundation
import SwiftUI


extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
