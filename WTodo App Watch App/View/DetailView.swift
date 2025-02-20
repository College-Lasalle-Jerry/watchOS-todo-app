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
    
    @State private var isCreditsPresented: Bool = false
    @State private var isSettingsPresented: Bool = false
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            
            HeaderView()
            
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
                    .onTapGesture {
                        isSettingsPresented.toggle()
                    }
                    .sheet(isPresented: $isSettingsPresented) {
                        SettingsView()
                    }
                Spacer()
                Text("\(count) / \(index + 1)")
                Spacer()
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditsPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditsPresented) {
                        CreditsView()
                    }
            }.foregroundStyle(.secondary)
        }.padding()
    }
}

#Preview {
    DetailView(note: Note(id: UUID(), text: "Something"), count: 10, index: 1)
}
