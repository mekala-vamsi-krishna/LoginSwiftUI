//
//  GradientButton.swift
//  LoginKit
//
//  Created by Mekala Vamsi Krishna on 8/12/23.
//

import SwiftUI

struct GradientButton: View {
    var title: String
    var icon: String
    var onClick: () -> ()
    var body: some View {
        Button {
            onClick()
        } label: {
            HStack(spacing: 15) {
                Text(title)
                Image(systemName: icon)
            }
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding(.vertical, 12)
            .padding(.horizontal, 35)
            .background(.linearGradient(colors: [.yellow, .orange, .red], startPoint: .top, endPoint: .bottom))
        }

    }
}

struct GradientButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
