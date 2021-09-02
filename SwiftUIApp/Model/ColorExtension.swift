//
//  ColorExtension.swift
//  SwiftUIApp
//
//  Created by Michał Dunajski on 01/09/2021.
//

import Foundation
import SwiftUI

extension Color {
    static let element = Color("Element")
    static let highlight = Color("Highlight")
    static let shadow = Color("Shadow")
  /// Create a Color view from an RGB object.
  ///   - parameters:
  ///     - rgb: The RGB object.
  init(rgbStruct rgb: RGB) {
    self.init(red: rgb.red, green: rgb.green, blue: rgb.blue)
  }
}
