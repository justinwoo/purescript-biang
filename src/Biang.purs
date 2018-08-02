module Biang where

import Data.Generic.Rep (class Generic, Argument, Constructor, Product, Sum)
import Prim.Row as Row
import Type.Prelude (Proxy, RProxy(..))

sumToRow
  :: forall ty rep row
   . Generic ty rep
  => SumToRow rep row
  => Proxy ty
  -> RProxy row
sumToRow _ = RProxy

class SumToRow rep (row :: # Type)
  | rep -> row

instance sumToRowSum ::
  ( SumToRow a r1
  , SumToRow b r2
  , Row.Union r1 r2 r
  ) => SumToRow (Sum a b) r

instance sumToRowConstructor ::
  ( Row.Cons name a () r
  ) => SumToRow (Constructor name a) r

productToRow
  :: forall ty rep row
   . Generic ty rep
  => ProductToRow rep row
  => Proxy ty
  -> RProxy row
productToRow _ = RProxy

class ProductToRow rep (row :: # Type)
  | rep -> row

instance productToRowConstructor ::
  ( ProductToRowImpl rep "a" l row
  ) => ProductToRow (Constructor name rep) row

class ProductToRowImpl rep (label :: Symbol) (out :: Symbol) (row :: # Type)
  | rep label -> out row

instance productToRowImplProduct ::
  ( ProductToRowImpl a l l' r1
  , AlphaSucc l' l''
  , ProductToRowImpl b l'' out r2
  , Row.Union r1 r2 r
  ) => ProductToRowImpl (Product a b) l out r

instance productToRowImplArgument ::
  ( Row.Cons l a () r
  ) => ProductToRowImpl (Argument a) l l r

class AlphaSucc (curr :: Symbol) (next :: Symbol)
  | curr -> next

instance alphasuccab :: AlphaSucc "a" "b"
instance alphasuccbc :: AlphaSucc "b" "c"
instance alphasucccd :: AlphaSucc "c" "d"
instance alphasuccde :: AlphaSucc "d" "e"
instance alphasuccef :: AlphaSucc "e" "f"
instance alphasuccfg :: AlphaSucc "f" "g"
instance alphasuccgh :: AlphaSucc "g" "h"
instance alphasucchi :: AlphaSucc "h" "i"
instance alphasuccij :: AlphaSucc "i" "j"
instance alphasuccjk :: AlphaSucc "j" "k"
instance alphasucckl :: AlphaSucc "k" "l"
instance alphasucclm :: AlphaSucc "l" "m"
instance alphasuccmn :: AlphaSucc "m" "n"
instance alphasuccno :: AlphaSucc "n" "o"
instance alphasuccop :: AlphaSucc "o" "p"
instance alphasuccpq :: AlphaSucc "p" "q"
instance alphasuccqr :: AlphaSucc "q" "r"
instance alphasuccrs :: AlphaSucc "r" "s"
instance alphasuccst :: AlphaSucc "s" "t"
instance alphasucctu :: AlphaSucc "t" "u"
instance alphasuccuv :: AlphaSucc "u" "v"
instance alphasuccvw :: AlphaSucc "v" "w"
instance alphasuccwx :: AlphaSucc "w" "x"
instance alphasuccxy :: AlphaSucc "x" "y"
instance alphasuccyz :: AlphaSucc "y" "z"
