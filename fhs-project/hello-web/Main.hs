import Web.Scotty

hi :: ActionM ()
hi = html "Hello!"

main :: IO ()
main = scotty 3000 $ do

  get "/hi" $ hi

  get "/hello" $ hi

  get "/echo/:word" $ do
    word <- param "word"
    html $ mconcat [ "<h1>Hello! You said ", word, "!</h1>" ]
