-- Exercise set 4b: folds

module Set4b where

import Mooc.Todo

------------------------------------------------------------------------------
-- Ex 1: countNothings with a fold. The function countNothings from
-- the course material can be implemented using foldr. Your task is to
-- define countHelper so that the following definition of countNothings
-- works.
--
-- Hint: You can start by trying to add a type signature for countHelper.
--
-- Challenge: look up the maybe function and use it in countHelper.
--
-- Examples:
--   countNothings []  ==>  0
--   countNothings [Just 1, Nothing, Just 3, Nothing]  ==>  2

countNothings :: [Maybe a] -> Int
countNothings xs = foldr countHelper 0 xs

<<<<<<< HEAD
countHelper (Nothing) sum = sum + 1
countHelper (Just _) sum = sum
=======
countHelper = todo
>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de

------------------------------------------------------------------------------
-- Ex 2: myMaximum with a fold. Just like in the previous exercise,
-- define maxHelper so that the given definition of myMaximum works.
--
-- Examples:
--   myMaximum []  ==>  0
--   myMaximum [1,3,2]  ==>  3

myMaximum :: [Int] -> Int
myMaximum [] = 0
myMaximum (x:xs) = foldr maxHelper x xs

<<<<<<< HEAD
maxHelper x mx = if x > mx then x else mx
=======
maxHelper = todo
>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de

------------------------------------------------------------------------------
-- Ex 3: compute the sum and length of a list with a fold. Define
-- slHelper and slStart so that the given definition of sumAndLength
-- works. This could be used to compute the average of a list.
--
-- Start by giving slStart and slHelper types.
--
-- Examples:
--   sumAndLength []             ==>  (0.0,0)
--   sumAndLength [1.0,2.0,4.0]  ==>  (7.0,3)


sumAndLength :: [Double] -> (Double,Int)
sumAndLength xs = foldr slHelper slStart xs

<<<<<<< HEAD
slStart = (0.0, 0)

slHelper :: Double -> (Double, Int) -> (Double, Int)
slHelper x (s, l) = (s + x, l + 1)

------------------------------------------------------------------------------
-- Ex 4: implement concat with with a fold. Define concatHelper and
-- concatStart so that the given definition of myConcat joins inner lists
-- of a list.
=======
slStart = todo
slHelper = todo

------------------------------------------------------------------------------
-- Ex 4: implement concat with a fold. Define concatHelper and
-- concatStart so that the given definition of myConcat joins inner
-- lists of a list.
>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de
--
-- Examples:
--   myConcat [[]]                ==> []
--   myConcat [[1,2,3],[4,5],[6]] ==> [1,2,3,4,5,6]

myConcat :: [[a]] -> [a]
myConcat xs = foldr concatHelper concatStart xs

<<<<<<< HEAD
concatStart = []
concatHelper x xs = x ++ xs
=======
concatStart = todo
concatHelper = todo
>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de

------------------------------------------------------------------------------
-- Ex 5: get all occurrences of the largest number in a list with a
-- fold. Implement largestHelper so that the given definition of largest works.
--
-- Examples:
--   largest [] ==> []
--   largest [1,3,2] ==> [3]
--   largest [1,3,2,3] ==> [3,3]

largest :: [Int] -> [Int]
largest xs = foldr largestHelper [] xs

<<<<<<< HEAD
largestHelper :: Int -> [Int] -> [Int]
largestHelper x [] = [x]
largestHelper x acc
    | myMaximum acc > x = acc
    | myMaximum acc == x = [x] ++ acc
    | otherwise = [x]
=======
largestHelper = todo

>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de

------------------------------------------------------------------------------
-- Ex 6: get the first element of a list with a fold. Define
-- headHelper so that the given definition of myHead works.
--
-- Start by giving headHelper a type.
--
-- Examples:
--   myHead []  ==>  Nothing
--   myHead [1,2,3]  ==>  Just 1

myHead :: [a] -> Maybe a
myHead xs = foldr headHelper Nothing xs

<<<<<<< HEAD
headHelper :: a -> Maybe a -> Maybe a
headHelper x _ = Just x
=======
headHelper = todo
>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de

------------------------------------------------------------------------------
-- Ex 7: get the last element of a list with a fold. Define lasthelper
-- so that the given definition of myLast works.
--
-- Start by giving lastHelper a type.
--
-- Examples:
--   myLast [] ==> Nothing
--   myLast [1,2,3] ==> Just 3

myLast :: [a] -> Maybe a
myLast xs = foldr lastHelper Nothing xs

<<<<<<< HEAD
lastHelper :: a -> Maybe a -> Maybe a
lastHelper x Nothing = Just x
lastHelper x (Just y) = Just y
=======
lastHelper = todo
>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de

