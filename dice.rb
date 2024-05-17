require "sinatra"
require "sinatra/reloader"

 get("/") {
  "Hello world"
}

get("zebra") do
  "Add a route"
end

get("/one/two") {
  "Two layers"
}

dice_count = 2
dice_side = 6

get("/dice/2/6") {
  num1 = rand(1..6)
  num2 = rand(1..6)
  sum = num1 + num2
  result = "You rolled a #{num1} and a #{num2} for a total of #{sum}."

  return "<h1>2d6</h1>
  <p>#{result}</p>"
}
