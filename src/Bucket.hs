module Bucket
  ( Bucket
  ) where

import Units (Bitcoin)


data Bucket = Bucket { range :: ( Bitcoin , Bitcoin )
                     , nUnconf :: Integer
                     , nConf :: Int
                     , prob :: Double
                     }


makeBuckets :: Double -> Integer -> [Bucket]
makeBuckets inc target = undefined

