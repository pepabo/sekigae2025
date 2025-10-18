import std/num/random

fun isort(l: list<(int, string)>, acc: list<(int, string)>)
  match (l) {
    Cons(x, xs) -> isort(xs, acc.insert(x))
    Nil -> acc
  }

fun insert( l: list<(int, string)>, e: (int, string) )
  match (l) {
    Cons(x, xs) -> if(e.fst > x.fst) then Cons(e, l) else Cons(x, xs.insert(e) )
    Nil -> e.single
  }

fun sekigae( members: list<string> ) : random list<string>
  members.map(fn(x){ (random-int(), x) }).isort([]).map(snd)

pub fun main()
    [
    "zipper",
    "takutaka",
    "drumato",
    "ressy",
    "shibatch",
    "masaki",
    "chiroru",
    "ryu-ch",
    "kmsn",
    ].sekigae.unlines.println
