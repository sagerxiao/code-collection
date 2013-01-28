package main

import (
    "fmt"
    "strconv"
    "errors"
)

func main() {
    var n8 int8
    var n16 int16
    var n int
    var s string
    var f float32
    println("Convert number to number...")
    n8 = 8
    n16 = int16(n8)
    n = int(n16)
    //n,_ = getint(n8)
    fmt.Printf("n8=%d, n8 type is %T\n", n8, n8)
    fmt.Printf("n16=%d, n16 type is %T\n", n16, n16)
    fmt.Printf("n=%d, n type is %T\n", n, n)

    println("Convert number to string...")
    s = strconv.Itoa(n)
    fmt.Printf("s=%s, s type is %T\n", s, s)

    println("Convert string to number...")
    n2,err := strconv.Atoi(s)
    if err != nil {
        println("convert s to number failed")
    } else {
        fmt.Printf("n2=%d, n2 type is %T\n", n2, n2)
    }
    println("Convert int to float...")
    f = float32(n)
    fmt.Printf("f=%f, f type is %T\n", f, f)
    println("Convert float32 to int...")
    f = float32(32) / 11
    fmt.Printf("f=(32/11)=%f, f type is %T\n", f, f)
    n3 := int(f)
    fmt.Printf("n3=%d, n3 type is %T\n", n3, n3)

}

func getint(v interface{}) (int, error) {
    switch i := v.(type) {
        case int8: return int(i), nil
        case uint8: return int(i), nil
        case int16: return int(i), nil
        case uint16: return int(i), nil
        case int32: return int(i), nil
        case uint32: return int(i), nil
    }
    return 0, errors.New("getint got a unknown type")
}

