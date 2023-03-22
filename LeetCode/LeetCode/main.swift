

import Foundation

let baseURL = URL(string: "http://192.168.1.32:8080/api/users")!


let searchURL = baseURL

let task = URLSession.shared.dataTask(with: searchURL) { (data, response, error) in
    let decoder = JSONDecoder()
    if let data = data,
        let users = try? decoder.decode([UserModel].self, from: data) {
//        print(data)
//        print(users)
        for u in users {
            print(u.username)
            for q in u.listOfQuizzes {
                print(q)
            }
        }
    } else {
        print("Either no data was returned, or data was not serialized.")
        return
    }
}
task.resume()

struct UserModel: Codable {
    let id: Int
    let username: String
    let password: String
    let listOfQuizzes: [Quiz]
}

struct Quiz:  Codable {
    let id: Int
    let title: String
}


