//
//  ListRow.swift
//  GithubAPIList
//
//  Created by Alexander Korchak on 11.05.2023.
//

import SwiftUI
import Kingfisher

struct ListRow: View {
    
    let user: User
    
    var body: some View {
        HStack(spacing: 12) {
            KFImage(URL(string: user.avatarUrl))
                .resizable()
                .background(.gray)
                .frame(width: 50, height: 50)
            .clipShape(Circle())
            Text(user.name)
        }
        .padding(4)
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(user: User(id: 100, name: "Username", avatarUrl: ""))
    }
}
