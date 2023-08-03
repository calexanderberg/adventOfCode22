package main

import (
  "strconv"
  "bufio"
  "fmt"
  "os"
  "sort"
)


func main() {
  var list = create_elf_list("./input.txt")
  fmt.Println("Most cal: ", last_vals(list, 1))
  fmt.Println("Most 3 cal: ", last_vals(list, 3))
}


func create_elf_list(filename string) []int {

  file, err := os.Open(filename)
  if err != nil {
    fmt.Println("Error opening file", file)
  }
  defer file.Close()

  var elf_list []int
  var single_elf = 0

  scanner := bufio.NewScanner(file)

  // Read the file line by line
  for scanner.Scan() {
      line := scanner.Text()
 
      if line == "" {
        elf_list = append(elf_list, single_elf)
        single_elf = 0
        
      } else {
        number, err := strconv.Atoi(line)

        single_elf += number

        if err != nil { 
          fmt.Println("Error converting string to int:", err) 
        }
      }
  }
  sort.Ints(elf_list)
  return elf_list 
}

func last_vals(slice []int, numbers int) int {
  values := 0
  for i := 0; i < numbers; i++ {
    values += slice[len(slice) - i - 1 ]
  }
  return values
}
