//
//  ContentView.swift
//  WTodo App Watch App
//
//  Created by Jerry Joy on 2025-02-17.
//

import SwiftUI

struct ContentView: View {
    
    
    // property
    @State private var notes: [Note] = [Note]()
    
    @State private var text: String = ""
    
    func save() {
//        dump(notes)
        do{
            let data = try JSONEncoder().encode(notes)
            
            let url = getDocumentsDirectory().appendingPathComponent("notes")
            
            try data.write(to: url)
            
        }catch {
            print("Saving data failed")
        }
    }
    
    func load(){
        DispatchQueue.main.async{
            do{
                let url = getDocumentsDirectory().appendingPathComponent("notes")
                let data = try Data(contentsOf: url)
                notes = try JSONDecoder().decode([Note].self, from: data)
            }catch {
                // do nothing.
            }
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            save()
        }
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .center, spacing: 4) {
                    TextField("Add a New Note", text: $text)
                    
                    Button {
                        print("button")
                        guard text.isEmpty == false else { return }
                        let note = Note(id: UUID(), text: text)
                        notes.append(note)
                        text = ""
                        save()
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 42, weight: .semibold))
                    }
                    .fixedSize()
                    .buttonStyle(PlainButtonStyle())
                    .foregroundStyle(.accent)

                }
                Spacer()
                if notes.count >= 1 {
                    List {
                        ForEach(0..<notes.count, id: \.self) {
                            i in
                            NavigationLink {
                                DetailView(note: notes[i], count: notes.count, index: i)
                            } label: {
                                HStack{
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundStyle(.accent)
                                    Text(notes[i].text)
                                        .lineLimit(1)
                                        .padding(.leading, 5)
                                }
                            }

                        }.onDelete(perform: delete)
                    }
                } else {
                    Spacer()
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.gray)
                        .padding(25)
                    Spacer()
                }
            }.navigationTitle("Notes")
                .onAppear {
                    load()
                }

        }
    }
}

#Preview {
    ContentView()
}
