package main

import "core:math"
import "core:fmt"
import "core:os"
import "core:strings"
import "core:strconv"
import "core:container"
import "core:time"
import "core:sys/windows"


// Custom libraries
import "aoc"
import "permute"
import "parse"


// Puzzles --------------------------------------------------------//
manhattan_distance :: proc(x, y: int) -> int
{
    return abs(x) + abs(y);
}


day_one :: proc(input: string) 
{
    using aoc;

    facing := 1;
    x := 0;
    y := 0;

    visited_locations := make(map[i64]bool);
    directions := strings.split(input, ", ");

    for direction in directions
    {
        //fmt.print(direction, x, y, facing, "->");
        if direction[0] == 'R'
        {
            facing = (facing - 1) %% 4;
        }
        else
        {
            facing = (facing + 1) %% 4;
        }

        units,_ := strconv.parse_int(direction[1:]);
        for i in 0..<units
        {
            x += int_cos[facing];
            y += int_sin[facing];

            location_hash := hash_2D(x, y);
            if location_hash in visited_locations
            {
                fmt.println(manhattan_distance(x, y));
                return;
            }
            visited_locations[location_hash] = true;
        }

        //fmt.println(x, y, facing);
    }

    // fmt.println(manhattan_distance(x, y));
}

day_two :: proc(input: string)
{
    
}


day_three :: proc(input: string)
{
    
}


day_four :: proc(input: string)
{

}


day_five :: proc(input: string)
{
    
}


day_six :: proc(input: string)
{
    
}


// Driver ---------------------------------------------------------//
read_input_file :: proc(index: int) -> (string, bool) 
{
    file_name: string;
    {
        inputs_prefix  :: "..\\inputs\\";
        inputs_postfix :: ".txt";
        
        builder := strings.make_builder();
        strings.write_string(&builder, inputs_prefix);
        
        // Prepend 0 for days 1-9
        if index < 10 do strings.write_int(&builder, 0);
        
        strings.write_int(&builder, index);
        strings.write_string(&builder, inputs_postfix);

        file_name = strings.to_string(builder);
    }
    
    data, success := os.read_entire_file(file_name);
    if !success do return "", success;
    return string(data), success;
}


do_day :: proc(day: int)
{
    input, read_success := read_input_file(day);
    if !read_success
    {
        fmt.println("Error occurred while reading input file");
        return;
    }
    switch day
    {
        case 1: day_one(input);
        // case 2: day_two(input);
        // case 3: day_three(input);
        // case 4: day_four(input);
        // case 5: day_five(input);
        // case 6: day_six(input);
        // case 7: day_seven(input);
        // case 8: day_eight(input);
        // case 9: day_nine(input);
        // case 10: day_ten(input);
        // case 11: day_eleven(input);
        // case 12: day_twelve(input);
        // case 13: day_thirteen(input);
        // case 14: day_fourteen(input);
        // case 15: day_fifteen(input);
        // case 16: day_sixteen(input);
        // case 17: day_seventeen(input);
        // case 18: day_eighteen(input);
        // case 19: day_nineteen(input);
        // case 20: day_twenty(input);
        // case 21: day_twenty_one(input);
        // case 22: day_twenty_two(input);
        // case 23: day_twenty_three(input);
        // case 24: day_twenty_four(input);
        // case 25: day_twenty_five(input);
    }
}

main :: proc() 
{
    do_day(1);
}