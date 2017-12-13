module Units
  ( Bitcoin(..)
  ) where

data Bitcoin = SAT Integer
             | UBTC Double
             | MBTC Double
             | BTC Double
               deriving(Show)

toSAT :: Bitcoin -> Bitcoin
toSAT = undefined

toUBTC :: Bitcoin -> Bitcoin
toUBTC = undefined

toMBTC :: Bitcoin -> Bitcoin
toMBTC = undefined

toBTC :: Bitcoin -> Bitcoin
toBTC = undefined
