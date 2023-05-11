//
//  LoaderView.swift
//  GithubAPIList
//
//  Created by Alexander Korchak on 11.05.2023.
//

import SwiftUI

struct LoaderView: View {
    
    var isFailed: Bool
    
    var body: some View {
        Text(isFailed ? "Loading is failed. Tap to try again" : "Loading...")
            .foregroundColor(isFailed ? .red : .green)
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView(isFailed: false)
    }
}
