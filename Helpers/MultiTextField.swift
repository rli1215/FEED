//
//  MultiTextField.swift
//  FEED (iOS)
//
//  Created by Rachel Li on 12/31/22.
//

import Foundation
import SwiftUI

struct MultiTextField: View {
    @Binding var value: String
    var placeholder: String = ""
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text:$value)
                .lineLimit(8)
                .cornerRadius(20)
                .border(Color.gray)
                .frame(width: 300, height: 100)
            Text(self.placeholder)
                .fontWeight(.light)
                .foregroundColor(.black.opacity(0.25))
                .padding(8)
                .allowsHitTesting(false)
                .opacity(!value.isEmpty ? 0 : 1)
        }
    }
}
