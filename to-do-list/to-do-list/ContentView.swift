//
//  ContentView.swift
//  to-do-list
//
//  Created by Olivia Kirby on 3/12/25.
//

import SwiftUI

struct Todo: Identifiable {
    var id = UUID()
    var item: String
    var isDone: Bool
    
}

struct ContentView: View {
    @State private var todos: [Todo] = [
        Todo(item: "", isDone: false)
    ]
    func removeRows(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Todoey")
                .font(.system(size:38))
                .bold()
                .foregroundColor(.yellow)
                .padding(7)
                .offset(x:10)
            List {
                ForEach($todos) { $todo in
                    HStack {
                        Button {
                            if todo.isDone == false {
                                todo.isDone = true
                            } else {
                                todo.isDone = false
                            }
                        } label: {
                            if todo.isDone == false {
                                Image(systemName: "circle")
                                    .foregroundColor(.yellow)
                                    .font(.system(size:18))
                            } else {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.yellow)
                                    .font(.system(size:18))
                            }
                        }
                        TextField("", text: $todo.item)
                            .font(.system(size:20))
                            .foregroundColor(todo.isDone ? .gray : .primary)
                    }
                }
                .onDelete(perform:removeRows)
            }
            .listStyle(.plain)
            .offset(x:10)
            Button {
                todos.append(Todo(item:"", isDone: false))
            } label: {
                HStack {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size:20))
                    Text("New Reminder")
                        .font(.system(size:24))
                        .foregroundColor(.yellow)
                        .bold()
                }
                .offset(x:35)
            }
        }
    }
}

#Preview {
    ContentView().preferredColorScheme(.dark)
}
