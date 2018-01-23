import Kitura
import Foundation

let router = Router()

router.all("/", middleware: BodyParser(), StaticFileServer(path: "./Public"))

router.get("/student1") { request, response, next in
    
    let data = [
        "info": [
            [
                "id": "1",
                "username": "victor",
                "password": "eemi2017"
            ]
        ],
        "courses": [
            [
                "place": "Les Panoramas",
                "begin": "9h",
                "end": "11h",
                "lat": "48.870537",
                "long": "2.342358",
                "marge": "200",
                "course": "Ruby on Rails"
            ],
            [
                "place": "Palais Brogniart",
                "begin": "11h15",
                "end": "13h15",
                "lat": "48.870537",
                "long": "2.342358",
                "marge": "200",
                "course": "Ruby on Rails"
            ],
            [
                "place": "Palais Brogniart",
                "begin": "14h15",
                "end": "16h15",
                "lat": "48.870537",
                "long": "2.342358",
                "marge": "200",
                "course": "Option design"
            ],
            [
                "place": "Les Panoramas",
                "begin": "16h30",
                "end": "18h30",
                "lat": "48.870537",
                "long": "2.342358",
                "marge": "200",
                "course": "Anglais"
            ]
        ]
    ]
    
    try response.send(data).end()
}

router.post("/login") { request, response, next in
    
    guard let body = request.body else {
        try response.status(.badRequest).end()
        return
    }
    
    guard case .urlEncoded(let data) = body else {
        try response.status(.badRequest).end()
        return
    }
    
    let username = data["username"]
    
    print(username ?? "User instance is nil")
    
    if (username == "victor") {
        response.send("true")
    } else {
        response.send("false")
    }
    next()
}

let port: Int
let defaultPort = 8080
if let requestedPort = ProcessInfo.processInfo.environment["PORT"] {
    port = Int(requestedPort) ?? defaultPort
} else {
    port = defaultPort
}

Kitura.addHTTPServer(onPort: port, with: router)
Kitura.run()
