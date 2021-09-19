{-# language OverloadedStrings #-}

module Main where

import Shellmet

import qualified Data.Text as T
import qualified Data.Text.IO as T

badCommand :: IO ()
badCommand = "ls" ["--XXX"]

tshow :: (Show a) => a -> T.Text
tshow = T.pack . show

main :: IO ()
main = do
  putStrLn "Hello, Haskell!"
  "echo" ["one", "two", "three"]
  "ls" ["-l"]
  badCommand $? T.putStrLn "Illegal command!"
  ok <- isSuccess badCommand
  T.putStrLn $ "isSuccess = " <> tshow ok
  let file = "LICENCE"
  text <- "cat" $| [file]
  let count = T.pack $ show $ length $ T.lines text
  "echo" ["Number of lines in " <> file <> ": " <> count]
