import System.Process (callProcess)
import System.Environment (getArgs)

main :: IO ()
main = do
    args <- getArgs
    callProcess "ghc" ("./" ++ head args ++ "/lib.hs")
    callProcess ("./" ++ head args ++ "/lib") []

