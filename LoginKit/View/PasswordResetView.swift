//
//  PasswordResetView.swift
//  LoginKit
//
//  Created by Mekala Vamsi Krishna on 8/12/23.
//

import SwiftUI

struct PasswordResetView: View {
    @Binding var showOtpView: Bool
    /// View Properties
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    /// Environment Properties
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundStyle(.gray)
            }
            .padding(.top, 10)

            Text("Reset Password")
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
                CustomTF(sfIcon: "lock", hint: "Password", isPassword: true, value: $password)
                
                CustomTF(sfIcon: "lock", hint: "Confirm Password", isPassword: true, value: $confirmPassword)
                    .padding(.top, 5)
                
                // Login Button
                
                GradientButton(title: "Verify OTP", icon: "arrow.right") {
                    /// My Code
                    Task {
                        dismiss()
                        try? await Task.sleep(for: .seconds(0))
                        /// Showing the rest view
                        showOtpView = true
                    }
                }
                .cornerRadius(25)
                .hSpacing(.trailing)
                
                /// Disabling until the data is entered
                .disableWithOpacity(password.isEmpty || confirmPassword.isEmpty)
            }
            .padding(.top, 5)
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        /// Since this is going to be a sheet.
        .interactiveDismissDisabled()
    }
}

struct PasswordResetView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
