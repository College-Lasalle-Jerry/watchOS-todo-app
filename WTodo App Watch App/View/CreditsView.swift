//
//  CreditsView.swift
//  WTodo App Watch App
//
//  Created by Jerry Joy on 2025-02-19.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack(spacing: 3) {
            
            Image("jerry")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 90)
                .clipShape(Circle())
                .padding()
                .layoutPriority(1)
            HeaderView(title: "Credits")
            
            
            Text("Jerry Joy")
                .foregroundStyle(.primary)
                .fontWeight(.bold)
            
            
            Text("Developer")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .fontWeight(.light)
            
        }
    }
}

#Preview {
    CreditsView()
}
