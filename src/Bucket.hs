module Bucket
  ( Bucket
  ) where

import Units (Bitcoin)


data Bucket = Bucket { range :: ( Bitcoin Double, Bitcoin Double)
                     , nUnconf :: Integer
                     , nConf :: Int
                     , prob :: Double
                     }


makeBuckets :: Double -> Integer -> [Bucket]
makeBuckets inc target = undefined

