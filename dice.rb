require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

 get("/") {
  erb(:elephant)
}

get("zebra") do
  "Add a route"
end

get("/one/two") {
  "Two layers"
}

# route 2/6
get("/dice/2/6") {
  first = rand(1..6)
  second = rand(1..6)
  sum = first + second

  @outcome = "You rolled a #{first} and a #{second} for a total of #{sum}."

  erb(:two_six, { :layout => :wrapper })
}

# routes for 1 dice
def one_dice_routes(dice_side)
  get("/dice/1/#{dice_side}") {
    num = rand(1..dice_side)
    return "<h1>1d#{dice_side}</h1>
    <p>You rolled a #{num}.</p>"

  }
end

dice_side_one = 10
one_dice_routes(dice_side_one)

# routes for 2 dices

# def two_dice_routes(dice_side)
#   get("/dice/2/#{dice_side}") {
#   num1 = rand(1..dice_side)
#   num2 = rand(1..dice_side)
#   sum = num1 + num2
#   result = "You rolled a #{num1} and a #{num2} for a total of #{sum}."

#   return "<h1>2d#{dice_side}</h1>
#   <p>#{result}</p>"
# }
# end

# dice_side_two = 6
# two_dice_routes(dice_side_two)
