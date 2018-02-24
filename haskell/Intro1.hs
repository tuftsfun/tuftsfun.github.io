import Test.QuickCheck

-- takes a list of anything, returns a list of same type
rev :: [a] -> [a]
rev l = rev' l []
  where
    rev' [] acc     = acc
    rev' (x:xs) acc = rev' xs (x:acc)

-- proposition you could test
prop_rev :: [Int] -> Bool
prop_rev l = rev (rev l) == l

-- lazy evaluation = nothing is evaluated until it's forced
-- means you can use infinite lists!
myTake :: Int -> [a] -> [a]
myTake 0 _      = []
myTake n (x:xs) = x:myTake (n-1) xs

firstFive = take 5 [100..]
{-
take 3 [100..]
= take 3 (100:[101..])
= 100:take 2 [101..]
= 100:(101:take 1 [102..])
= 100:(101:(102:take 0 [103..]))
  // note that the [103..] never gets evaluated due to lazy evaluation
  // because the base case of `take` never uses it, nothing forces it to be evaluated
= 100:101:102:[] = [100, 101, 102]

while in non-lazy (strict/eager) languages (ML, Erlang, Scheme):
take 3 [100..]
= take 3 [100, 101, 102, 103, ...]
= loops
  // in an eager language, expressions are always evaluated immediately once they appear
-}
