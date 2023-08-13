//
//  Login.swift
//  LoginKit
//
//  Created by Mekala Vamsi Krishna on 8/12/23.
//

import SwiftUI

struct Login: View {
    @Binding var showSignup: Bool
    /// View Properties
    @State private var emailID: String = ""
    @State private var password: String = ""
    @State private var showForgotPasswordView: Bool = false
    /// Show Reset View
    @State private var showResetView: Bool = false
    @State private var showOtpView: Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Spacer(minLength: 0)
            
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Text("Please sign in to continue")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                /// Custom Textfields
                CustomTF(sfIcon: "at", hint: "Email ID", value: $emailID)
                
                CustomTF(sfIcon: "lock", hint: "Password", isPassword: true, value: $password)
                    .padding(.top, 5)
                
                Button {
                    showForgotPasswordView.toggle()
                } label: {
                    Text("Forgot Password?")
                }
                .font(.callout)
                .fontWeight(.heavy)
                .tint(.orange)
                .hSpacing(.trailing)
                
                // Login Button
                
                GradientButton(title: "Login", icon: "arrow.right") {
                    //
                }
                .cornerRadius(25)
                .hSpacing(.trailing)
                
                /// Disabling until the data is entered
                .disableWithOpacity(emailID.isEmpty || password.isEmpty )
            }
            .padding(.top, 5)
            
            Spacer(minLength: 0)
            
            HStack(spacing: 6) {
                Text("Don't have an account?")
                    .foregroundStyle(.gray)
                Button {
                    showSignup.toggle()
                } label: {
                    Text("Signup")
                }
                .fontWeight(.bold)
                .tint(.orange)
            }
            .font(.callout)
            .hSpacing()
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .toolbar(.hidden, for: .navigationBar)
        /// Asking Email ID for sending reset link
        .sheet(isPresented: $showForgotPasswordView) {
            if #available(iOS 16.4, *) {
                /// For Corner radius sheet.
                ForgotPassword(showResetView: $showResetView)
                    .presentationDetents([.height(300)])
                    .presentationCornerRadius(30)
            } else {
                ForgotPassword(showResetView: $showResetView)
                    .presentationDetents([.height(300)])
            }
        }
        /// Resetting New Password
        .sheet(isPresented: $showResetView) {
            if #available(iOS 16.4, *) {
                /// For Corner radius sheet.
                PasswordResetView(showOtpView: $showOtpView)
                    .presentationDetents([.height(350)])
                    .presentationCornerRadius(30)
            } else {
                PasswordResetView(showOtpView: $showOtpView)
                    .presentationDetents([.height(350)])
            }
        }
        .sheet(isPresented: $showOtpView) {
            if #available(iOS 16.4, *) {
                /// For Corner radius sheet.
                OTPView()
                    .presentationDetents([.height(250)])
                    .presentationCornerRadius(30)
            } else {
                OTPView()
                    .presentationDetents([.height(250)])
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
