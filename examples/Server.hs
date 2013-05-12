{-# LANGUAGE IncoherentInstances #-}
module Main (main) where

import Remote.KRPC
import Shared


main :: IO ()
main = server 6000
  [ unitM ==> return
  , echoM ==> return
  , swapM ==> \(a, b) -> return (b, a)
  , reverseM ==> return . reverse
  , shiftR ==> \(a, b, c) -> return (c, a, b)
  ]
