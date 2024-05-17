require "sinatra"

 get("/") {
  "Hello world"
}

get("zebra") do
  "Add a route"
end
