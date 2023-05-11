//
//  ContentView.swift
//  GithubAPIList
//
//  Created by Alexander Korchak on 11.05.2023.
//

import SwiftUI

struct UsersListView: View {
    
    @StateObject var viewModel: UserViewModel = .init()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.users, id: \.id) { users in
                    ListRow(user: users)
                }
                LoaderView(isFailed: viewModel.isFailed)
                    .onAppear {
                        getUsers()
                    }
                    .onTapGesture {
                        tapLoaderView()
                    }
            }
            .listStyle(.grouped)
            .navigationTitle("Github users")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
    
    private func getUsers() {
        viewModel.getUsers()
    }
    
    private func tapLoaderView() {
        if viewModel.isFailed {
            viewModel.isFailed = false
            getUsers()
        }
    }
}

struct  UsersList_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
    }
}
