import Vapor

extension Droplet {
    func setupRoutes() throws {
        
        get("basic") { req in
            guard let input = req.data["input"]?.string else  {
                throw Abort.badRequest
            }
            return "Raw Input: \(input)"
            
        }
        
        get("alpha") { req in
            guard let input = req.data["input"]?.string else  {
                throw Abort.badRequest
            }
            return input.emailAddress.address
        }
        
        get("/") { request in
            return "Hello World!"
        }
        
        get("/view") { req in
            return try self.view.make("view.html")
        }
        
        get("hello") { req in
            var json = JSON()
            try json.set("hello", "world")
            return json
        }

        get("plaintext") { req in
            return "Hello, world!"
        }

        // response to requests to /info domain
        // with a description of the request
        get("info") { req in
            return req.description
        }

        get("description") { req in return req.description }
        
        try resource("posts", PostController.self)
    }
}
