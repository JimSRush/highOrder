--Some implementations of high order functions in haskell
--Jim Rush, 2015


--Filter is a function that takes a predicate, and returns a list of elements that satisfy the predicate.
filter' :: (a -> Bool) -> [a] -> [a]  
filter' _ [] = []  --base case
filter' p (x:xs)   --split head & recurse 
    | p x       = x : filter' p xs  --if the predicate matches, bind x to the recusive call and send in the tail
    | otherwise = filter' p xs  --otherwise skip & recurse on the tail

--Takes a function, a starting point in the list (usually zero if folding from the left)
--returns 
foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' f x [] = x
foldl' f x (z:zs) = foldl f (f x z) zs

--Sums all elements in a list, implemented using the fold left function (folds in (+) using partial function application)
sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' xs = foldl (+) 0 xs

--map: takes a list and a function and applies that function to every element in the list.
<<<<<<< HEAD:HighOrder.hs
map' :: (a -> b) -> [a] -> [b]  
map' _ [] = []   --base case of anything / empty list, returns the empty list
map' f (x:xs) = f x : map f xs --otherwise split the head and recurse on the tail
=======
map :: (a -> b) -> [a] -> [b]  
map _ [] = []   --base case of anything / empty list, returns the empty list
map f (x:xs) = f x : map f xs --otherwise split the head and recurse on the tail
>>>>>>> adaeabe0a9d2e17fb1529c8ab3f278c3d9a06952:highOrder.hs
