import Kitura

let router = Router()

router.all("/", middleware: BodyParser(), StaticFileServer(path: "./Public"))

router.get("/student1") { request, response, next in
    
    try response.send([
        "place": "Palais Brogniart",
        "begin": "9h",
        "end": "11h",
        "lat": "48.8688356",
        "long": "2.3414426",
        "marge": "500"
    ]).end()
}

router.get("/student2") { request, response, next in
    
    try response.send([
        "place": "Les Panoramas",
        "begin": "9h",
        "end": "11h",
        "lat": "48.870537",
        "long": "2.342358",
        "marge": "200"
        ]).end()
}


let port = 8080

Kitura.addHTTPServer(onPort: port, with: router)
Kitura.run()
