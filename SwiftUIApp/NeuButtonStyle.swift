//
//  NeuButtonStyle.swift
//  SwiftUIApp
//
//  Created by Michał Dunajski on 01/09/2021.
//

import SwiftUI

struct NeuButtonStyle: ButtonStyle {
  let width: CGFloat
  let height: CGFloat

  func makeBody(configuration: Self.Configuration)
  -> some View {
    configuration.label
        .opacity(configuration.isPressed ? 0.2 : 1)
        .frame(width: width, height: height)
        .background(
            Group {
              if configuration.isPressed {
                Capsule()
                  .fill(Color.element)
              } else {
                Capsule()
                  .fill(Color.element)
                  .northWestShadow()
              }
            })
  }
}
