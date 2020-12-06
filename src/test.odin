package main;

import "core:fmt"

a :: [4]int{4, 3, 2, 1};

main :: proc()
{
    i := 1;
    // Doesn't work because a is constant
    // fmt.println(a[i]);

    // Does work
    fmt.println(a[1]);
}