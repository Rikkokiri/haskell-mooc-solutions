{-# LANGUAGE CPP, ScopedTypeVariables, TemplateHaskell #-}

module Mooc.Test where

<<<<<<< HEAD
import Control.Exception (evaluate,SomeException,fromException)
import Control.Monad
import Control.DeepSeq (deepseq)
=======
import Control.DeepSeq (deepseq)
import Control.Exception (try,evaluate,SomeException,fromException,bracket,finally)
import Control.Monad
>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de
import Data.Foldable
import Data.Functor
import Data.List
import Data.Maybe
import Data.Monoid
import Data.Semigroup
<<<<<<< HEAD
import System.Environment
=======
import GHC.IO.Handle
import System.Directory
import System.Environment
import System.IO
>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de
import System.Timeout
import Test.QuickCheck
import Test.QuickCheck.Monadic

import Mooc.Todo

-- better assertions

-- strict counterexample', in case showing some values causes errors or never terminates
counterexample' string prop = string `deepseq` counterexample string prop

expectation expected actual = counterexample' ("  Expected: " ++ show expected ++ "\n  Was: " ++ show actual)

expected ==? actual = expectation expected actual (expected == actual)
actual ?== expected = expected ==? actual

infix 4 ==?
infix 4 ?==

actual ?~= expected = expectation expected actual (abs (actual-expected) < 0.01)
expected =~? actual = actual ?~= expected

infix 4 =~?
infix 4 ?~=

hasElements expected actual = counterexample' ("  Expected elements (in any order): " ++ show expected
                                               ++ "\n  Was: " ++ show actual)
                              (sort expected == sort actual)

<<<<<<< HEAD
=======
hasElementsDuplicates expected actual =
  counterexample' ("  Expected elements (in any order, duplicates allowed): " ++ show expected
                    ++ "\n  Was: " ++ show actual)
  (nub (sort expected) == nub (sort actual))

>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de
was f actual = counterexample' ("  Was: "++show actual) (f actual)

-- helpers

shrinkPositive :: Int -> [Int]
shrinkPositive = map getPositive . shrink . Positive

forAllShrink_ :: Arbitrary a => Gen a -> (a -> Property) -> Property
forAllShrink_ gen = forAllShrinkBlind gen shrink

forAll_ :: Arbitrary a => (a -> Property) -> Property
forAll_ = forAllShrink_ arbitrary

<<<<<<< HEAD
=======
-- nondeterministic conjoin
conjoin' :: Testable prop => [prop] -> Property
conjoin' ps = property $ elements ps

>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de
-- timeouts for evaluation

timedMillis = 500

timed val k = monadicIO $ do
  res <- run $ timeout (timedMillis*1000) $ evaluate val
  case res of
    Nothing -> return $ counterexample' ("  didn't return in "++show timedMillis++"ms") $ False
    Just v -> return $ k v

<<<<<<< HEAD
=======
-- exceptions

eval :: a -> PropertyM IO (Either SomeException a)
eval x = run $ try $ evaluate x

isFail :: Either SomeException a -> Property
isFail (Left e) = property True
isFail (Right _) = counterexample "  should fail" False

shouldFail :: a -> Property
shouldFail x = monadicIO $ fmap isFail $ eval x

-- testing IO

stop_ p = stop p >> return ()

withOverrideHandle :: Handle -> Handle -> IO a -> IO a
withOverrideHandle new old op =
  bracket (hDuplicate old) hClose $ \oldcopy ->
  bracket (hDuplicateTo new old) (\_ -> hDuplicateTo oldcopy old) $ \_ ->
  op

withStdinout :: Handle -> Handle -> IO a -> IO a
withStdinout newin newout =
  withOverrideHandle newin stdin . withOverrideHandle newout stdout

capture :: String -> IO a -> IO (String,a)
capture input op = do
  dir <- getTemporaryDirectory
  (path,h) <- openTempFile dir "haskell-exercises.in"
  hPutStrLn h input
  hClose h

  (opath,oh) <- openTempFile dir "haskell-exercises.out"
  read <- openFile path ReadMode

  val <- withStdinout read oh op `finally`
    do hClose oh
       hClose read

  str <- readFile opath

  return $ length str `seq` (str,val) -- try to avoid half-open handles

runc string op = run (capture string op)

runc' op = run (capture "" op)

withNoInput :: ((String,a) -> Property) -> IO a -> Property
withNoInput k op = monadicIO $ do
  res <- runc' op
  stop_ $ k res

withInput :: String -> ((String,a) -> Property) -> IO a -> Property
withInput inp k op =
  counterexample (" With input:\n  "++show inp) $ -- TODO render input?
  monadicIO $ do
    res <- runc inp op
    stop_ $ k res

checkOutput k (text,_) = counterexample " Printed output:" $ k text -- TODO check list of lines instead?
checkResult k (_,val) = counterexample " Produced value:" $ k val

check kOut kRes x = checkOutput kOut x .&&. checkResult kRes x

>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de
-- handling TODO excercises

isTodo :: SomeException -> Bool
isTodo e = case fromException e of Just TODO -> True
                                   _ -> False

resultIsTodo :: Result -> Bool
resultIsTodo (Failure {theException = (Just e)}) = isTodo e
resultIsTodo _ = False

-- scoring

data Outcome = Pass | Fail | Todo deriving (Show, Eq, Ord)

instance Semigroup Outcome where
  (<>) = max

instance Monoid Outcome where
  mempty = Pass

quietArgs = stdArgs {chatty=False}

<<<<<<< HEAD
timeLimit = 10 * 1000 * 1000 -- 10 seconds in microseconds

myCheck :: Testable prop => prop -> IO Outcome
myCheck prop = quickCheckWithResult quietArgs (within timeLimit prop) >>= interpret
=======
globalTimeLimit = 10 * 1000 * 1000 -- 10 seconds in microseconds

myCheck :: Testable prop => prop -> IO Outcome
myCheck prop = quickCheckWithResult quietArgs (within globalTimeLimit prop) >>= interpret
>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de
  where interpret res
          | resultIsTodo res = return Todo
          | isSuccess res = return Pass
          | otherwise = putStrLn (output res) >> return Fail

histogram vals = [(head xs, length xs) | xs <- group (sort vals)]

textAttr False a s = s
textAttr True a s = "\ESC[" ++ a ++ "m" ++ s ++ "\ESC[0m"
textBold color = textAttr color "1"
textBoldGreen color = textAttr color "1;32"
textBoldRed color = textAttr color "1;31"
textBlue color = textAttr color "34"

showCheck :: Bool -> Outcome -> String
showCheck color Todo = "_"
showCheck color Pass = textBoldGreen color "1"
showCheck color Fail = textBoldRed color "0"

showOutcome :: Bool -> Outcome -> String
showOutcome color Pass = textBoldGreen color "+++++ Pass"
showOutcome color Fail = textBoldRed color "----- Fail"
showOutcome color Todo = textBlue color "00000 Todo"

showExercise :: Bool -> Int -> String
showExercise color i = textBold color $ "===== EXERCISE " ++ show i

showFinal :: Bool -> [Outcome] -> String
showFinal color outs = concatMap (showCheck color) outs ++ "\n" ++ show score ++ " / " ++ show total
  where score = length $ filter (==Pass) outs
        total = length outs

type Test = (Int,String,[Property])

<<<<<<< HEAD
=======
precondition :: Property -> [Test] -> [Test]
precondition prop = map (\(i,n,ps) -> (i,n,prop:ps))

>>>>>>> ff1d1666d936ef425ce22d8bfb575d18c68c59de
toJSON :: [(Int,String,Outcome)] -> String
toJSON ts = "[" ++ intercalate "," (map f ts) ++ "]"
  where f (i,name,outcome) = "{\"number\":"++show i++",\"name\":"++show name++",\"outcome\":\""++show outcome++"\"}"

score :: [Test] -> IO ()
score tests = do
  color <- fmap isNothing $ lookupEnv "NO_COLOR"
  triples <- forM tests $ \(i,n,ts) -> do
    putStrLn $ showExercise color i
    out <- fold <$> mapM myCheck ts
    putStrLn $ showOutcome color out
    return (i,n,out)
  let outcomes = [o | (_,_,o) <- triples]
  putStrLn "===== TOTAL"
  putStrLn $ showFinal color outcomes
  writeFile "score.json" $ toJSON triples
