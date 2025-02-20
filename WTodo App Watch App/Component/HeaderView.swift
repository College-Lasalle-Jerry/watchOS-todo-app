//
//  HeaderView.swift
//  WTodo App Watch App
//
//  Created by Jerry Joy on 2025-02-19.
//

import SwiftUI

struct HeaderView: View {
    var title: String = ""
    var body: some View {
        VStack {
            // title
            if title != "" {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.accent)
            }
            
            // seperator
            HStack{
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                
                Capsule()
                    .frame(height: 1)
            }.foregroundStyle(.accent)
        }
    }
}

#Preview {
    Group{
        HeaderView()
        HeaderView(title: "Credits")
    }
}
