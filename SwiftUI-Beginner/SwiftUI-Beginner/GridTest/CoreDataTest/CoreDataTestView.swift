//
//  CoreDataTestView.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 28/8/24.
//

import SwiftUI

struct CoreDataTestView: View {
    
    @StateObject private var viewModel = CoreDataTestViewModel()
    
    @State var fruitName : String = ""
    
    @State var showSheet = false
    @State var showEditTaskSheet = false
    @State var taskToEdit : FruitEntity? = nil
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            
            BackgroundView(showSheet: $showSheet)
            
            if shouldShowBlugBG() {
                BlurBG()
            }
            
            VStack {
                List(viewModel.taskList) { fruit in
                    HStack {
                        Text(fruit.title ?? "N/A")
                        
                    }
                    .listRowBackground(EmptyView())
                    .listRowSeparator(.hidden)
                    .contextMenu(menuItems: {
                        Button(action: { editTaskItem(fruit) },
                               label: { editMenu } )
                        
                        Button(action: { deleteTaskItem(fruit)},
                               label: { deleteMenu } )
                    })
                    
                    
                }
                .listStyle(.plain)
                
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Task Management")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "plus.circle")
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                showSheet.toggle()
                            }
                        }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "chevron.left")
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
            
            //            if showSheet {
            //
            //                VStack {
            //                    Spacer()
            //                    AddFruitView(showSheet : $showSheet) { name in
            //                        viewModel.addFruit(title: name)
            //
            //                    }
            //                }
            //                .ignoresSafeArea()
            //                .frame(maxHeight: UIScreen.screenHeight)
            //            }
            
        }
        .sheet(isPresented: $showSheet, content: {
            getAddTaskView()
        })
        .sheet(isPresented: $showEditTaskSheet, content: {
            getTaskEditScreen()
        })
        .navigationBarBackButtonHidden()
        .onAppear{
            viewModel.fetchTaskList()
        }
        
        
    }
    
    
    private func editTaskItem(_ fruit : FruitEntity) {
//        print("Edit Fruit Item : \(fruit.title)")
        taskToEdit = fruit
        showEditTaskSheet.toggle()
        
    }
    
    private func deleteTaskItem(_ fruit : FruitEntity) {
        print("Delete Fruit Item : \(fruit.title)")
    }
    
    private var editMenu : some View {
        Label {
            Text("Edit")
        } icon: {
            Image(systemName: "pencil")
        }
    }
    
    private var deleteMenu : some View {
        Label {
            Text("Delete")
        } icon: {
            Image(systemName: "trash")
        }
    }
    
    private func getAddTaskView() -> AddTaskView {
        return AddTaskView(showSheet : $showSheet) { name in
            viewModel.addFruit(title: name)
            showSheet.toggle()
        }
    }
    
    private func getTaskEditScreen() -> EditFruitView {
        return EditFruitView(showSheet: $showEditTaskSheet, fruitToEdit: $taskToEdit) { newName in
            if let fruitItem = taskToEdit {
                viewModel.updateTaskName(fruit: fruitItem, newName: newName)
                showEditTaskSheet.toggle()
            }
            
            
        }
    }
    
    private func shouldShowBlugBG() -> Bool {
        return showSheet || showEditTaskSheet
    }
}


struct AddTaskView : View {
    
    @State var fruitName : String = ""
    @Binding var showSheet : Bool
    
    var addFruitDelegate : (String) -> Void
    
    var body: some View {
        VStack(alignment : .leading) {
            
            FruitFieldHeader(title: "Add Fruit", showSheet: $showSheet)
            
            TextField("Enter fruit name", text: $fruitName)
                .modifier(FruitFieldModifier())
            
            
            Button(action: {
                addFruitDelegate(fruitName)
            }, label: {
                FruitFieldDoneButton(label: "Add Fruit")
            })
            .modifier(FruitFieldDoneButtonModifier())
            
            Spacer()
        }
        .modifier(FruitFieldViewModifier())
        
    }
}


struct EditFruitView : View {
    
    @State var fruitName : String = ""
    @Binding var showSheet : Bool
    
    @Binding var fruitToEdit : FruitEntity?
    
    var editFruitDelegate : (String) -> Void
    
    var body: some View {
        VStack(alignment : .leading) {
            
            FruitFieldHeader(title: "Edit Task", showSheet: $showSheet)
            
            TextField("Enter task name", text: $fruitName)
                .modifier(FruitFieldModifier())
            
            
            Button(action: {
                editFruitDelegate(fruitName)
            }, label: {
                FruitFieldDoneButton(label: "Save Changes")
            })
            .modifier(FruitFieldDoneButtonModifier())
            
            Spacer()
        }
        .modifier(FruitFieldViewModifier())
        .onAppear {
            fruitName = fruitToEdit?.title ?? ""
        }
        
    }
}

#Preview {
    NavigationView {
        CoreDataTestView()
    }
    
}

struct BlurBG: View {
    var body: some View {
        Rectangle()
            .ignoresSafeArea()
            .background(.ultraThinMaterial)
    }
}

struct BackgroundView : View {
    
    @Binding var showSheet : Bool
    
    var body: some View {
        ZStack {
            Image("AnimatedBG")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            Color.black.opacity(showSheet ? 0.4 : 0.6)
                .ignoresSafeArea()
            
        }
    }
}

struct FruitFieldHeader : View {
    
    let title : String
    @Binding var showSheet : Bool
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .padding()
                .foregroundStyle(.black)
                .fontWeight(.semibold)
            
            Spacer()
            
            Image(systemName: "xmark")
                .foregroundStyle(.black)
                .fontWeight(.semibold)
                .padding()
                .onTapGesture {
                    withAnimation(.spring) {
                        showSheet.toggle()
                    }
                }
            
        }
        .padding(.top,30)
    }
}

struct FruitFieldDoneButton : View {
    
    let label : String
    
    var body: some View {
        Text(label)
            .font(.title3)
            .padding()
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 8).fill(.green)
            )
    }
}


struct FruitFieldModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.black)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.2))
            )
            .padding()
    }
}


struct FruitFieldViewModifier : ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(maxHeight: .infinity)
            .padding(.horizontal,10)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(.white)
            )
            .ignoresSafeArea()
            .presentationDetents([.fraction(0.35)])
        
    }
}

struct FruitFieldDoneButtonModifier : ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
            .padding(.bottom,40)
    }
}
