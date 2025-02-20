//
//  Settings.swift
//  WTodo App Watch App
//
//  Created by Jerry Joy on 2025-02-19.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var value: Float = 1.0
    @FocusState private var isFocused: Bool // digital crownfocus
    
    
    func update() {
        lineCount = Int(value)
    }
    
    var body: some View {
        VStack(spacing: 8) {
            HeaderView(title: "Settings")
            
            Text("Lines: \(lineCount)".uppercased())
            
            // custom Bindind value
            Slider(value: Binding(get: {
                self.value
            }, set: { newValue in
                self.value = newValue
                self.update()
            }), in: 1...4, step: 1)
                .tint(.accent)
                .focused($isFocused)
                
        }.onAppear {
            value = Float(lineCount)
            isFocused = true
        }
    }
}

#Preview {
    SettingsView()
}
