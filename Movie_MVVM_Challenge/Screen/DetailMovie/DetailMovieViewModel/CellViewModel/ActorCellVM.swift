//
//  ActorCellVM.swift
//  Movie_MVVM_Challenge
//
//  Created by Nguyễn Đình Kiên on 18/05/2024.
//

import Foundation
struct ActorCellVM {
    let name: String?
    let avatar: String?

    init(actor: ActorModel) {
        self.name = actor.originalName ?? actor.name
        self.avatar = actor.profilePath
    }
    
}
