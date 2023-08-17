



findDir :: [String] -> String -> Int
findDir (x : xs) str = 
  | x == str = calcDirValue xs 0
  | otherwise = findDir xs str

calcDirValue :: [String] -> Int -> Int
calcDirValue (x : xs) val =
  | command !! 1 == "ls" = calcDirValue xs val
  | command !! 0 == "dir" = val + findDir xs ("$ dir " + (command !! 1))
  | x == "$ cd .." = val
  | otherwise = calcDirValue xs (val + read (command !! 0))
  where command = words x


  
