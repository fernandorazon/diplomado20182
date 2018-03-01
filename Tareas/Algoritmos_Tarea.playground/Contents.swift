

//: Playground - noun: a place where people can play

import UIKit



//Esta funcion valida si un numero es primo
func primo(n: Int) -> Bool {
    var a = true
    if n < 2{
        a = false
    } else if n == 2 {
        a = true
    } else {
        for i in 2...(n-1){
            if n%i == 0 {
                a = false
                break
            } else {
                a = true
            }
        }
    }
    return a
}

print(primo(n: 18))



//Serie de fibonacci que solo imprima los primos

//Esta funcion solo realiza la serie de fibonacci
func fibonacci(n: Int)->Int{
    if n < 2 {
        return n
    } else {
        return fibonacci(n: n-1) + fibonacci(n: n-2)
    }
}

//Esta funcion solo imprimira los numeros primos de la serie Fibonacci del 1 al 100
//Hacerlo del 1 al 10 000 tal como German lo propuso, crashea al IDE

var i = 1
while fibonacci(n: i) < 100 {
    if primo(n: fibonacci(n: i)) == true{
        print(fibonacci(n: i))
    }
    i += 1
}






//Verificar si una cadena es palindromo

func palindromo(str: String){
    let reverse = String(str.reversed())
    if reverse == str {
        print("Es palindronomo")
    } else {
        print("No es palindromo")
    }
}

palindromo(str: "anitalavalatina")

//Funcion que compara dos cadenas

func comparaCadenas(str:String, str2:String) -> Bool{
    return str.count == str2.count && str.sorted() == str2.sorted()
}
comparaCadenas(str: "hola", str2: "aloh")
print(comparaCadenas(str: "hola", str2: "aloh"))


