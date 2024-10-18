import System.Process (callProcess)
import System.Environment (getArgs)

main :: IO ()
main = do
    args <- getArgs
    case args of
        [year, day] -> callProcess "ghc" ["./" ++ year ++ "/" ++ day ++ "/lib.hs"]
