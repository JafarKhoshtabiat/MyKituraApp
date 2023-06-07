import KituraContracts
import Kitura

func initializeCodableRoutes(app: App) {
    app.router.get("/states", handler: app.getStatesHandler)
    app.router.get("/cities", handler: app.getCitiesHandler)
    app.router.get("/address", handler: app.getPostalAddress)
}

extension App {
    func getStatesHandler(completion: ([State], RequestError?) -> Void) {
        let result = [State(id: 1, name: "تهران"),
                      State(id: 2, name: "آذربایجان شرقی"),
                      State(id: 3, name: "کرمان"),
                      State(id: 4, name: "آذربایجان غربی"),
                      State(id: 5, name: "اردبیل"),
                      State(id: 6, name: "اصفهان"),
                      State(id: 7, name: "البرز"),
                      State(id: 8, name: "ایلام"),
                      State(id: 9, name: "بوشهر"),
                      State(id: 10, name: "چهارمحال و بختیاری"),
                      State(id: 11, name: "خراسان جنوبی"),
                      State(id: 12, name: "خراسان رضوی")]
        completion(result, nil)
    }
        
    func getCitiesHandler(stateId: Int, completion: ([City], RequestError?) -> Void) {
        let cities: [City]
        switch stateId {
        case 1:
            cities = [City(id: 1, name: "تهران", stateId: 1),
                          City(id: 2, name: "شهریار", stateId: 1),
                          City(id: 3, name: "قدس", stateId: 1)]
        case 2:
            cities = [City(id: 1, name: "آذرشهر", stateId: 2),
                          City(id: 2, name: "تبریز", stateId: 2),
                          City(id: 3, name: "سراب", stateId: 2)]
        case 3:
            cities = [City(id: 1, name: "کرمان", stateId: 3),
                          City(id: 2, name: "سیرجان", stateId: 3),
                          City(id: 3, name: "رفسنجان", stateId: 3)]
        default:
            cities = [City(id: 1, name: "شهر اول", stateId: stateId),
                      City(id: 2, name: "شهر دوم", stateId: stateId),
                      City(id: 3, name: "شهر سوم", stateId: stateId)]
        }
        
        completion(cities, nil)
    }
    
    func getPostalAddress(postalCode: String, completion: (PostalAddress, RequestError?) -> Void) {
        let postalAddress: PostalAddress
        switch postalCode {
        case "1234567890":
            postalAddress = PostalAddress(state: "تهران", city: "تهران", address: "خیابان دکتر هوشیار")
        case "2345678901":
            postalAddress = PostalAddress(state: "آذربایجان شرقی", city: "تبریز", address: "خیابان ولیعصر")
        case "3456789012":
            postalAddress = PostalAddress(state: "کرمان", city: "سیرجان", address: "خیابان شریعتی")
        default:
            postalAddress = PostalAddress(state: "استان", city: "شهر", address: "خیابان")
        }
        print(postalCode)
        print(postalAddress)
        completion(postalAddress, nil)
    }
}

struct State: Codable {
    let id: Int
    let name: String
}

struct City: Codable {
    let id: Int
    let name: String
    let stateId: Int
}

struct PostalAddress: Codable {
    let state: String
    let city: String
    let address: String
}
