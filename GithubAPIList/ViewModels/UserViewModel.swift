//
//  UserViewModel.swift
//  GithubAPIList
//
//  Created by Alexander Korchak on 11.05.2023.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isFailed: Bool = false
    var cancellables = Set<AnyCancellable>()
    
    private let usersPerPage = 25
    private var currentId: Int? = nil
    
    func getUsers() {
        APIService.shared.fetchUsers(perPage: usersPerPage, sinceId: currentId)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.isFailed = true
                    print(error)
                case .finished:
                    print(completion)
                }
            } receiveValue: { [weak self] users in
                guard let self = self else {
                    return
                }
                self.users.append(contentsOf: users)
                self.currentId = users.last?.id
            }
            .store(in: &cancellables)
    }
}
