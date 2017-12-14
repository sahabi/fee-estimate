module Units
  ( toSAT
  , toUBTC
  , toMBTC
  , toBTC
  , Bitcoin(..)
  ) where

data Bitcoin = SAT Double
             | UBTC Double
             | MBTC Double
             | BTC Double
               deriving(Show, Arbitrary)

instance Eq Bitcoin where
  x == y = toSATVal x == (toSATVal y)

instance Ord Bitcoin where
  x >= y = toSATVal x >= (toSATVal y)
  x <= y = toSATVal x <= (toSATVal y)

getVal :: Bitcoin -> Double
getVal (SAT x) = x

toSATVal :: Bitcoin -> Double
toSATVal = getVal . toSAT

toSAT :: Bitcoin -> Bitcoin
toSAT (SAT x) = SAT x
toSAT (UBTC x) = SAT $ x * 100
toSAT (MBTC x) = SAT $ x * 100000
toSAT (BTC x) = SAT $ x * 100000000

toUBTC :: Bitcoin -> Bitcoin
toUBTC (SAT x) = UBTC $ x / 100
toUBTC x = toUBTC $ toSAT x

toMBTC :: Bitcoin -> Bitcoin
toMBTC (SAT x) = MBTC $ x / 100000
toMBTC x = toMBTC $ toSAT x

toBTC :: Bitcoin -> Bitcoin
toBTC (SAT x) = BTC $ x / 100000000
toBTC x = toBTC $ toSAT x
