# Purescript-Biang

[![Build Status](https://travis-ci.org/justinwoo/purescript-biang.svg?branch=master)](https://travis-ci.org/justinwoo/purescript-biang)

A library for converting generic reps of Sum and Product to row types, for whatever convenient usage needs at the type level.

Biang, like the noodles

![](https://i.imgur.com/bvqiF1I.png)

## Usage

```purs
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
```

See the [API Docs](https://pursuit.purescript.org/packages/purescript-biang/) or the [tests](test/Main.purs) for usage.
