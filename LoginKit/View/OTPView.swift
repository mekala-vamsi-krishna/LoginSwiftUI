//
//  OTPView.swift
//  LoginKit
//
//  Created by Mekala Vamsi Krishna on 8/12/23.
//

import SwiftUI

struct OTPView: View {
    @State var otpText: String = ""
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

            Text("Enter OTP")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
            
            Text("Please enter recieved OTP to your email for verification")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                /// OTP Textfields
                CustomTF(sfIcon: "key", hint: "Enter OTP", value: $otpText)
                    .keyboardType(.numberPad)
                
                // Login Button
                GradientButton(title: "Verify", icon: "checkmark.circle") {
                    /// My Code
                }
                .cornerRadius(25)
                .hSpacing(.trailing)
                
                /// Disabling until the data is entered
                .disableWithOpacity(otpText.isEmpty)
            }
            .padding(.top, 5)
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        /// Since this is going to be a sheet.
        .interactiveDismissDisabled()
    }
}

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
