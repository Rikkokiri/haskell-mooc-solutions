-- Exercise set 5a
--
-- * defining algebraic datatypes
-- * recursive datatypes

module Set5a where

import Mooc.Todo

------------------------------------------------------------------------------
-- Ex 1: Define the type Vehicle that has four constructors: Bike,
-- Bus, Tram and Train.
--
-- The constructors don't need any fields.
<<<<<<< HEAD
data Vehicle = Bike | Bus | Tram | Train
=======

>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de

------------------------------------------------------------------------------
-- Ex 2: Define the type BusTicket that can represent values like these:
--  - SingleTicket
--  - MonthlyTicket "January"
--  - MonthlyTicket "December"

<<<<<<< HEAD
data BusTicket = SingleTicket | MonthlyTicket String
=======
>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de

------------------------------------------------------------------------------
-- Ex 3: Here's the definition for a datatype ShoppingEntry that
-- represents an entry in a shopping basket. It has an item name (a
-- String), an item price (a Double) and a count (an Int). You'll also
-- find two examples of ShoppingEntry values.
--
-- Implement the functions totalPrice and buyOneMore below.

data ShoppingEntry = MkShoppingEntry String Double Int
  deriving Show

threeApples :: ShoppingEntry
threeApples = MkShoppingEntry "Apple" 0.5 3

twoBananas :: ShoppingEntry
twoBananas = MkShoppingEntry "Banana" 1.1 2

-- totalPrice should return the total price for an entry
--
-- Hint: you'll probably need fromIntegral to convert the Int into a
-- Double
--
-- Examples:
--   totalPrice threeApples  ==> 1.5
--   totalPrice twoBananas   ==> 2.2

totalPrice :: ShoppingEntry -> Double
<<<<<<< HEAD
totalPrice (MkShoppingEntry _ price count) = price * fromIntegral count
=======
totalPrice = todo
>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de

-- buyOneMore should increment the count in an entry by one
--
-- Example:
--   buyOneMore twoBananas    ==> MkShoppingEntry "Banana" 1.1 3

buyOneMore :: ShoppingEntry -> ShoppingEntry
<<<<<<< HEAD
buyOneMore (MkShoppingEntry name price count) = MkShoppingEntry name price (count + 1)
=======
buyOneMore = todo
>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de

------------------------------------------------------------------------------
-- Ex 4: define a datatype Person, which should contain the age (an
-- Int) and the name (a String) of a person.
--
-- Also define a Person value fred, and the functions getAge, getName,
-- setAge and setName (see below).

<<<<<<< HEAD
data Person = MkPerson String Int
=======
data Person = PersonUndefined
>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de
  deriving Show

-- fred is a person whose name is Fred and age is 90
fred :: Person
<<<<<<< HEAD
fred = MkPerson "Fred" 90

-- getName returns the name of the person
getName :: Person -> String
getName (MkPerson name _) = name

-- getAge returns the age of the person
getAge :: Person -> Int
getAge (MkPerson _ age) = age

-- setName takes a person and returns a new person with the name changed
setName :: String -> Person -> Person
setName name (MkPerson _name age) = MkPerson name age

-- setAge does likewise for age
setAge :: Int -> Person -> Person
setAge age (MkPerson name _age) = MkPerson name age
=======
fred = todo

-- getName returns the name of the person
getName :: Person -> String
getName p = todo

-- getAge returns the age of the person
getAge :: Person -> Int
getAge p = todo

-- setName takes a person and returns a new person with the name changed
setName :: String -> Person -> Person
setName name p = todo

-- setAge does likewise for age
setAge :: Int -> Person -> Person
setAge age p = todo
>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de

------------------------------------------------------------------------------
-- Ex 5: define a datatype Position which contains two Int values, x
-- and y. Also define the functions below for operating on a Position.
--
-- Examples:
--   getY (up (up origin))    ==> 2
--   getX (up (right origin)) ==> 1

<<<<<<< HEAD
data Position = MkPosition Int Int

-- origin is a Position value with x and y set to 0
origin :: Position
origin = MkPosition 0 0 

-- getX returns the x of a Position
getX :: Position -> Int
getX (MkPosition x _) = x

-- getY returns the y of a position
getY :: Position -> Int
getY (MkPosition _ y) = y

-- up increases the y value of a position by one
up :: Position -> Position
up (MkPosition x y) = MkPosition x (y + 1)

-- right increases the x value of a position by one
right :: Position -> Position
right (MkPosition x y) = MkPosition (x + 1) y
=======
data Position = PositionUndefined

-- origin is a Position value with x and y set to 0
origin :: Position
origin = todo

-- getX returns the x of a Position
getX :: Position -> Int
getX = todo

-- getY returns the y of a position
getY :: Position -> Int
getY = todo

-- up increases the y value of a position by one
up :: Position -> Position
up = todo

-- right increases the x value of a position by one
right :: Position -> Position
right = todo
>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de

------------------------------------------------------------------------------
-- Ex 6: Here's a datatype that represents a student. A student can
-- either be a freshman, a nth year student, or graduated.

data Student = Freshman | NthYear Int | Graduated
  deriving (Show,Eq)

-- Implement the function study, which changes a Freshman into a 1st
-- year student, a 1st year student into a 2nd year student, and so
-- on. A 7th year student gets changed to a graduated student. A
-- graduated student stays graduated even if he studies.

study :: Student -> Student
<<<<<<< HEAD
study Freshman = NthYear 1
study (NthYear 7) = Graduated
study Graduated = Graduated
study (NthYear x) = NthYear (x+1)
=======
study = todo
>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de

------------------------------------------------------------------------------
-- Ex 7: define a datatype UpDown that represents a counter that can
-- either be in increasing or decreasing mode. Also implement the
-- functions zero, toggle, tick and get below.
--
-- NB! Define _two_ constructors for your datatype (feel free to name the
-- constructors however you want)
--
-- Examples:
--
-- get (tick zero)
--   ==> 1
-- get (tick (tick zero))
--   ==> 2
-- get (tick (tick (toggle (tick zero))))
--   ==> -1

<<<<<<< HEAD
data UpDown = Decreasing Int | Increasing Int

-- zero is an increasing counter with value 0
zero :: UpDown
zero = Increasing 0

-- get returns the counter value
get :: UpDown -> Int
get (Increasing v) = v
get (Decreasing v) = v
=======
data UpDown = UpDownUndefined1 | UpDownUndefined2

-- zero is an increasing counter with value 0
zero :: UpDown
zero = todo

-- get returns the counter value
get :: UpDown -> Int
get ud = todo
>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de

-- tick increases an increasing counter by one or decreases a
-- decreasing counter by one
tick :: UpDown -> UpDown
<<<<<<< HEAD
tick (Increasing v) = Increasing (v + 1)
tick (Decreasing v) = Decreasing (v - 1)
=======
tick ud = todo
>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de

-- toggle changes an increasing counter into a decreasing counter and
-- vice versa
toggle :: UpDown -> UpDown
<<<<<<< HEAD
toggle (Increasing v) = Decreasing v
toggle (Decreasing v) = Increasing v
=======
toggle ud = todo
>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de

------------------------------------------------------------------------------
-- Ex 8: you'll find a Color datatype below. It has the three basic
-- colours Red, Green and Blue, and two color transformations, Mix and
-- Invert.
--
-- Mix means the average of the two colors in each rgb channel.
--
-- Invert means subtracting all rgb values from 1.
--
-- Implement the function rgb :: Color -> [Double] that returns a list
-- of length three that represents the rgb value of the given color.
--
-- Examples:
--
-- rgb Red   ==> [1,0,0]
-- rgb Green ==> [0,1,0]
-- rgb Blue  ==> [0,0,1]
--
-- rgb (Mix Red Green)                    ==> [0.5,0.5,0]
-- rgb (Mix Red (Mix Red Green))          ==> [0.75,0.25,0]
-- rgb (Invert Red)                       ==> [0,1,1]
-- rgb (Invert (Mix Red (Mix Red Green))) ==> [0.25,0.75,1]
-- rgb (Mix (Invert Red) (Invert Green))  ==> [0.5,0.5,1]

data Color = Red | Green | Blue | Mix Color Color | Invert Color
  deriving Show

rgb :: Color -> [Double]
<<<<<<< HEAD
rgb Red = [1,0,0]
rgb Green = [0,1,0]
rgb Blue = [0,0,1]
rgb (Invert c) = [1 - i | i <- rgb c]
rgb (Mix c1 c2) = map (/ 2.0) (zipWith (+) (rgb c1) (rgb c2))
=======
rgb col = todo
>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de

------------------------------------------------------------------------------
-- Ex 9: define a parameterized datatype OneOrTwo that contains one or
-- two values of the given type. The constructors should be called One and Two.
--
-- Examples:
--   One True         ::  OneOrTwo Bool
--   Two "cat" "dog"  ::  OneOrTwo String

<<<<<<< HEAD
data OneOrTwo a = One a | Two a a
=======
>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de

------------------------------------------------------------------------------
-- Ex 10: define a recursive datatype KeyVals for storing a set of
-- key-value pairs. There should be two constructors: Empty and Pair.
--
-- Empty represents an empty collection. It should have no fields.
--
-- Pair should have three fields, one for the key, one for the value,
-- and one for the rest of the collection (of type KeyVals)
--
-- The KeyVals datatype is parameterized by the key type k and
-- the value type v.
--
-- For example:
--
--  Pair "cat" True (Pair "dog" False Empty)  ::  KeyVals String Bool
--
-- Also define the functions toList and fromList that convert between
-- KeyVals and lists of pairs.

<<<<<<< HEAD
data KeyVals k v = Empty | Pair k v (KeyVals k v)
  deriving Show

toList :: KeyVals k v -> [(k,v)]
toList Empty = []
toList (Pair k v kvs) = [(k, v)] ++ toList kvs

fromList :: [(k,v)] -> KeyVals k v
fromList [] = Empty
fromList ((k,v):xs) = Pair k v (fromList xs)
=======
data KeyVals k v = KeyValsUndefined
  deriving Show

toList :: KeyVals k v -> [(k,v)]
toList = todo

fromList :: [(k,v)] -> KeyVals k v
fromList = todo
>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de

------------------------------------------------------------------------------
-- Ex 11: The data type Nat is the so called Peano
-- representation for natural numbers. Define functions fromNat and
-- toNat that convert natural numbers to Ints and vice versa.
--
-- Examples:
--   fromNat (PlusOne (PlusOne (PlusOne Zero)))  ==>  3
--   toNat 3    ==> Just (PlusOne (PlusOne (PlusOne Zero)))
--   toNat (-3) ==> Nothing
--

data Nat = Zero | PlusOne Nat
  deriving (Show,Eq)

<<<<<<< HEAD


fromNat :: Nat -> Int
fromNat Zero = 0
fromNat (PlusOne x) = 1 + fromNat (x)

toNat :: Int -> Maybe Nat
toNat z = if z < 0
          then Nothing
          else Just (toNat' z)
  where toNat' x = if x == 0 then Zero else PlusOne(toNat' (x-1))
=======
fromNat :: Nat -> Int
fromNat n = todo

toNat :: Int -> Maybe Nat
toNat z = todo
>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de

------------------------------------------------------------------------------
-- Ex 12: While pleasingly simple in its definition, the Nat datatype is not
-- very efficient computationally. Instead of the unary Peano natural numbers,
-- computers use binary numbers.
--
-- Binary numbers are like decimal numbers, except that binary numbers have
-- only two digits (called bits), 0 and 1. The table below gives some
-- examples:
--
--   decimal | binary
--   --------+-------
--         0 |      0
--         1 |      1
--         2 |     10
--         7 |    111
--        44 | 101100
--
-- For allowing arbitrarily long binary numbers, our representation, the
-- datatype Bin, includes a special End constructor for denoting the end of
-- the binary number. In order to make computation with Bin easier, the bits
-- are represented in increasing order by significance (i.e. "backwards").
-- Consider the Bin numbers O (I (I End)), representing 110 in binary or
-- 6 in decimal, and I (I (O End)) that represents 011 in binary or 3 in
-- decimal. The most significant (last) bit, the bit I, of O (I (I End)) is
-- greater than the bit O, which is the most significant bit of I (I (O End)).
-- Therefore, O (I (I End)) is greater than I (I (O End)).
--
-- Your task is to write functions prettyPrint, fromBin, and toBin that
-- convert Bin to human-readable string, Bin to Int, and Int to Bin
-- respectively.
--
-- Examples:
--   prettyPrint End                     ==> ""
--   prettyPrint (O End)                 ==> "0"
--   prettyPrint (I End)                 ==> "1"
--   prettyPrint (O (O (I (O (I End))))) ==> "10100"
--   map fromBin [O End, I End, O (I End), I (I End), O (O (I End)),
--                  I (O (I End))]
--     ==> [0, 1, 2, 3, 4, 5]
--   fromBin (I (I (O (O (I (O (I (O End)))))))) ==> 83
--   fromBin (I (I (O (O (I (O (I End)))))))     ==> 83
--   map toBin [0..5] ==>
--     [O End,I End,O (I End),I (I End),O (O (I End)),I (O (I End))]
--   toBin 57 ==> I (O (O (I (I (I End)))))
--
-- Challenge: Can you implement toBin by directly converting its input into a
-- sequence of bits instead of repeatedly applying inc?
--
data Bin = End | O Bin | I Bin
  deriving (Show, Eq)

-- This function increments a binary number by one.
inc :: Bin -> Bin
inc End   = I End
inc (O b) = I b
inc (I b) = O (inc b)

prettyPrint :: Bin -> String
<<<<<<< HEAD
prettyPrint End = ""
prettyPrint (O b) = "0" ++ prettyPrint b
prettyPrint (I b) = "1" ++ prettyPrint b

fromBin :: Bin -> Int
fromBin (O End) = 0
fromBin (I End) = 1
fromBin (O b) = 2 * fromBin b
fromBin (I b) = 1 + 2 * fromBin b 

toBin :: Int -> Bin
toBin num
  | num == 0 = O End
  | num == 1 = I End
  | mod num 2 == 0 = O (toBin (num `div` 2))
  | otherwise = I (toBin (num `div` 2))
=======
prettyPrint = todo

fromBin :: Bin -> Int
fromBin = todo

toBin :: Int -> Bin
toBin = todo
>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de
