module Test.Main where

import Prelude

import Biang (productToRow, sumToRow)
import Data.Generic.Rep (class Generic, Argument, NoArguments)
import Effect (Effect)
import Effect.Console (log)
import Type.Prelude (Proxy(..), RProxy)

data Fruit = Apple | Banana String | Kiwi Int
derive instance genericFruit :: Generic Fruit _

-- inferred type:
fruitRow :: RProxy
  ( "Apple" :: NoArguments
  , "Banana" :: Argument String
  , "Kiwi" :: Argument Int
  )
fruitRow = sumToRow (Proxy :: Proxy Fruit)

data Thing = Thing Int String Boolean
derive instance genericThing :: Generic Thing _

-- inferred type:
thingRow :: RProxy
  ( a :: Int
  , b :: String
  , c :: Boolean
  )
thingRow = productToRow (Proxy :: Proxy Thing)

main :: Effect Unit
main = do
  log "done"
