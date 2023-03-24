//
//  File.swift
//  ToWhereApp
//
//  Created by Николай Прощалыкин on 03.03.2023.
//

import Foundation

struct Source {
    static private let tasks = [
    "сходить на Stand Up",
    "сходить на Выставку",
    "сходить в кино",
    "сходить на квест",
    "завалиться смотреть сериал"
    ]
    
    static func getTask() -> String? {
        tasks.randomElement()
    }
}
