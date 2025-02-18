//
//  DetailView.swift
//  WTodo App Watch App
//
//  Created by Jerry Joy on 2025-02-17.
//

import SwiftUI

struct DetailView: View {
    let note: Note
    let count: Int
    let index: Int
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            HStack{
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                
                Capsule()
                    .frame(height: 1)
            }.foregroundStyle(.accent)
            
            Spacer()
            
            ScrollView {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            
            HStack(alignment: .center) {
                Image(systemName: "gear")
                Spacer()
                Text("\(count) / \(index + 1)")
                Spacer()
                Image(systemName: "info.circle")
                    .imageScale(.large)
            }.foregroundStyle(.secondary)
        }.padding()
    }
}

#Preview {
    DetailView(note: Note(id: UUID(), text: "Something"), count: 10, index: 1)
}
