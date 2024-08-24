//
//  SearchSortTest.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 24/8/24.
//

import SwiftUI

class UserModel : Identifiable {
    
    let id : String = UUID().uuidString
    let name : String
    let points : Int
    let isVerified : Bool
    
    init(name: String, points: Int, isVerified: Bool) {
        self.name = name
        self.points = points
        self.isVerified = isVerified
    }
    
}

enum SortOption {
    case NameAsc, NameDsc, PointAsc, PointDsc
}

class SearchSortViewModel : ObservableObject {
    
    @Published var users : [UserModel] = []
    @Published var filteredUsers : [UserModel] = []
    
    static var shared : SearchSortViewModel = SearchSortViewModel()
    
    private init(){
        
    }
    
    
    func fetchUsers() {
        let user1 = UserModel(name: "User 1", points: 19, isVerified: false)
        let user2 = UserModel(name: "User 2", points: 21, isVerified: true)
        let user3 = UserModel(name: "User 3", points: 1, isVerified: false)
        let user4 = UserModel(name: "User 4", points: 32, isVerified: false)
        let user5 = UserModel(name: "User 5", points: 5, isVerified: true)
        let user6 = UserModel(name: "User 6", points: 7, isVerified: false)
        let user7 = UserModel(name: "User 7", points: 12, isVerified: true)
        let user8 = UserModel(name: "User 8", points: 65, isVerified: false)
        let user9 = UserModel(name: "User 9", points: 34, isVerified: false)
        let user10 = UserModel(name: "User 10", points: 10, isVerified: true)
        users.append(contentsOf: [user1,user2,user3,user4,user5,user6,user7,user8,user9,user10])
        filteredUsers.append(contentsOf: users)
    }
    
    func sortUsersBy(option : SortOption) {
        switch(option) {
        case .NameAsc:
            sortByNameAsc()
        case .NameDsc:
            sortByNameDsc()
        case .PointAsc:
            sortByPointAsc()
        case .PointDsc:
            sortByPointDsc()
        }
        
    }
    
    private func sortByNameAsc(){
        filteredUsers = users.sorted(by: { user1, user2 in
            return user1.name < user2.name
        })
    }
    
    private func sortByNameDsc(){
        filteredUsers = users.sorted(by: { user1, user2 in
            return user1.name > user2.name
        })
        
    }
    
    private func sortByPointAsc(){
        filteredUsers = users.sorted(by: { user1, user2 in
            return user1.points < user2.points
        })
        
    }
    
    private func sortByPointDsc(){
        filteredUsers = users.sorted(by: { user1, user2 in
            return user1.points > user2.points
        })
        
    }
    
    
    func searchUser(keyword : String){
        if(keyword.isEmpty) {
            filteredUsers = users
        } else {
            filteredUsers = users.filter({ user in
                return user.name.contains(keyword) || "\(user.points)".contains(keyword)
            })
        }
        
    }
    
    func hasValidList() -> Bool {
        return !filteredUsers.isEmpty
        
    }
    
    
    
}

struct SearchSortTest: View {
    
    @StateObject var viewModel = SearchSortViewModel.shared
    @State var showSortOptionSheet = false
    
    
    var body: some View {
        
        VStack {
            
            SearchView()
            
            if viewModel.hasValidList() {
                List(viewModel.filteredUsers, rowContent: { user in
                    HStack {
                        VStack(alignment : .leading) {
                            Text(user.name)
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("\(user.points) Points")
                                .foregroundStyle(.primary.opacity(0.5))
                        }
                        
                        Spacer()
                        
                        if user.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundStyle(.blue)
                                .font(.subheadline)
                        }
                    }
                    
                    
                })
                .padding()
                .listStyle(.plain)
            } else {
                EmptyUserView()
            }
            
            
        }
        .navigationTitle("User List")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing, content: {
                Image(systemName: "line.3.horizontal.decrease")
                    .onTapGesture {
                        showSortOptionSheet.toggle()
                    }
            })
        }
        // MARK: END of VSTACK
        .onAppear {
            viewModel.fetchUsers()
        }
        .sheet(isPresented: $showSortOptionSheet, content: {
            SortOptionSheet(showSheet: $showSortOptionSheet)
        })
        
        
    }
}


struct SortOptionSheet : View {
    
    @StateObject var viewModel = SearchSortViewModel.shared
    @Binding var showSheet : Bool
    
    var body: some View {
        ScrollView {
            VStack(alignment : .leading, spacing : 10) {
                Text("Sort By...")
                    .font(.title2)
                    .padding()
                Group {
                    Text("Name (Ascending)")
                        .padding()
                        .onTapGesture {
                            viewModel.sortUsersBy(option: .NameAsc)
                            showSheet.toggle()
                        }
                    Divider()
                    Text("Name (Descending)")
                        .padding().onTapGesture {
                            viewModel.sortUsersBy(option: .NameDsc)
                            showSheet.toggle()
                        }
                    Divider()
                    Text("Points (Ascending)")
                        .padding()
                        .onTapGesture {
                            viewModel.sortUsersBy(option: .PointAsc)
                            showSheet.toggle()
                        }
                    Divider()
                    Text("Points (Descending)")
                        .padding().onTapGesture {
                            viewModel.sortUsersBy(option: .PointDsc)
                            showSheet.toggle()
                        }
                }
                .font(.system(size: 20))
                
            }
        }
        .presentationDetents([.fraction(0.5)])
    }
}


struct SearchView : View {
    @State var searchText : String = ""
    @StateObject var viewModel = SearchSortViewModel.shared
    var body: some View {
        ZStack {
            TextField(text: $searchText, label: {
                Text("Search Here...")
                
            })
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.15))
            )
            .padding()
        }
        .onChange(of: searchText) { oldValue, newValue in
            viewModel.searchUser(keyword: newValue)
        }
    }
}

struct EmptyUserView : View {
    var body: some View {
        VStack {
            
            Spacer()
            
            Image(systemName: "person.fill.xmark")
                .font(.title)
                .padding()
            
            
            Text("No User Found with this name or point")
            
            Spacer()
        }
    }
}

#Preview {
    SearchSortTest()
}
