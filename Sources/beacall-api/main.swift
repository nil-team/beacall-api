import Kitura
import Foundation

let router = Router()

router.all("/", middleware: BodyParser(), StaticFileServer(path: "./Public"))

router.get("/student1") { request, response, next in
    
    let data = [
        "course": [
            [
                "place": "Les Panoramas",
                "begin": "9h",
                "end": "11h",
                "lat": "48.870537",
                "long": "2.342358",
                "marge": "200"
            ],
            [
                "place": "Les Panoramas",
                "begin": "11h15",
                "end": "13h15",
                "lat": "48.870537",
                "long": "2.342358",
                "marge": "200"
            ],
            [
                "place": "Les Panoramas",
                "begin": "14h15",
                "end": "16h15",
                "lat": "48.870537",
                "long": "2.342358",
                "marge": "200"
            ],
            [
                "place": "Les Panoramas",
                "begin": "16h30",
                "end": "18h30",
                "lat": "48.870537",
                "long": "2.342358",
                "marge": "200"
            ]
        ]
    ]
    
    try response.send(data).end()
}

// Resolve the port that we want the server to listen on.
let port: Int
let defaultPort = 8080
if let requestedPort = ProcessInfo.processInfo.environment["PORT"] {
    port = Int(requestedPort) ?? defaultPort
} else {
    port = defaultPort
}

// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: port, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()
