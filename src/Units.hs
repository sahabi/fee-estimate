module Units
  ( toSAT
  , toUBTC
  , toMBTC
  , toBTC
  , Bitcoin(..)
  ) where

data Bitcoin a = SAT Double
               | UBTC Double
               | MBTC Double
               | BTC Double
                 deriving(Show)

instance Eq (Bitcoin a) where
  x == y = toSATVal x == (toSATVal y)

instance Ord (Bitcoin a) where
  x >= y = toSATVal x >= (toSATVal y)
  x <= y = toSATVal x <= (toSATVal y)

instance Num (Bitcoin a) where
  SAT x + (SAT y) = SAT (x + y)
  x + y = toSAT x + toSAT y
  x - y = x + (negate y)
  negate (SAT x) = SAT (negate x)
  negate  x = negate (toSAT x)

getVal :: Bitcoin a -> Double
getVal (SAT x) = x

toSATVal :: Bitcoin a -> Double
toSATVal = getVal . toSAT

toSAT :: Bitcoin a -> Bitcoin a
toSAT (SAT x) = SAT x
toSAT (UBTC x) = SAT $ x * 100
toSAT (MBTC x) = SAT $ x * 100000
toSAT (BTC x) = SAT $ x * 100000000

toUBTC :: Bitcoin a -> Bitcoin a
toUBTC (SAT x) = UBTC $ x / 100
toUBTC x = toUBTC $ toSAT x

toMBTC :: Bitcoin a -> Bitcoin a
toMBTC (SAT x) = MBTC $ x / 100000
toMBTC x = toMBTC $ toSAT x

toBTC :: Bitcoin a -> Bitcoin a
toBTC (SAT x) = BTC $ x / 100000000
toBTC x = toBTC $ toSAT x
