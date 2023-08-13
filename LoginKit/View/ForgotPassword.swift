//
//  ForgotPassword.swift
//  LoginKit
//
//  Created by Mekala Vamsi Krishna on 8/12/23.
//

import SwiftUI

struct ForgotPassword: View {
    @Binding var showResetView: Bool
    /// View Properties
    @State private var emailID: String = ""
    /// Environment Properties
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            }
            .padding(.top, 10)

            Text("Forgot Password")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
            
            Text("Please enter your email ID so that we can send the reset link.")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                /// Custom Textfields
                CustomTF(sfIcon: "at", hint: "Email ID", value: $emailID)
                
                // Login Button
                
                GradientButton(title: "Reset Password", icon: "arrow.right") {
                    /// My Code
                    /// After the link sent
                    Task {
                        dismiss()
                        try? await Task.sleep(for: .seconds(0))
                        /// Showing the rest view
                        showResetView = true
                    }
                }
                .cornerRadius(25)
                .hSpacing(.trailing)
                
                /// Disabling until the data is entered
                .disableWithOpacity(emailID.isEmpty)
            }
            .padding(.top, 5)
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        /// Since this is going to be a sheet.
        .interactiveDismissDisabled()
    }
}

struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
