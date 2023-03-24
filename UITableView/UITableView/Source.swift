import Foundation
import UIKit

struct Contact {
    let name: String
    let image: UIImage
    let descriprion: String
    let gender: Gender
}

enum Gender {
    case male
    case female
}

struct ImageName {
    static let person = "person"
    static let fillPerson = "person.fill"
}

struct Descriprion {
    static let description = "приятная девушка"
    static let description2 = "приятный молодой человек"
}

struct Source {
    static func makeContacts() -> [Contact] {
        [
            .init(name: "Алиса", image: .init(systemName: ImageName.person)!, descriprion: Descriprion.description, gender: .female),
            .init(name: "Арина",image: .init(systemName: ImageName.person)!, descriprion: Descriprion.description,gender: .female),
            .init(name: "Астрид",image: .init(systemName: ImageName.person)!, descriprion: Descriprion.description,gender: .female),
            .init(name: "Ксения",image: .init(systemName: ImageName.person)!, descriprion: Descriprion.description,gender: .female),
            .init(name: "Мария", image: .init(systemName: ImageName.person)!, descriprion: Descriprion.description, gender: .female),
            .init(name: "Марта",image: .init(systemName: ImageName.person)!, descriprion: Descriprion.description,gender: .female),
            .init(name: "Равшана",image: .init(systemName: ImageName.person)!, descriprion: Descriprion.description,gender: .female),
            .init(name: "Селена",image: .init(systemName: ImageName.person)!, descriprion: Descriprion.description,gender: .female),
            .init(name: "Ульяна",image: .init(systemName: ImageName.person)!, descriprion: Descriprion.description,gender: .female),
            .init(name: "Юна",image: .init(systemName: ImageName.person)!, descriprion: Descriprion.description,gender: .female),
        
            .init(name: "Боб", image: .init(systemName: ImageName.fillPerson)!, descriprion: Descriprion.description2, gender: .male),
            .init(name: "Альберт", image: .init(systemName: ImageName.fillPerson)!, descriprion: Descriprion.description2, gender: .male),
            .init(name: "Вадим", image: .init(systemName: ImageName.fillPerson)!, descriprion: Descriprion.description2, gender: .male),
            .init(name: "Глеб", image: .init(systemName: ImageName.fillPerson)!, descriprion: Descriprion.description2, gender: .male),
            .init(name: "Давид", image: .init(systemName: ImageName.fillPerson)!, descriprion: Descriprion.description2, gender: .male),
            .init(name: "Исмаил", image: .init(systemName: ImageName.fillPerson)!, descriprion: Descriprion.description2, gender: .male),
            .init(name: "Игорь", image: .init(systemName: ImageName.fillPerson)!, descriprion: Descriprion.description2, gender: .male),
            .init(name: "Леон", image: .init(systemName: ImageName.fillPerson)!, descriprion: Descriprion.description2, gender: .male),
        ]
    }
    
    static func makeContactsWithGroup() -> [[Contact]] {
        let male = makeContacts().filter{ $0.gender == .male }
        let female = makeContacts().filter { $0.gender == .female }
        return [male, female]
    }
    
}
