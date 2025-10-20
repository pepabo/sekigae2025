import std/num/random

struct seki
  ord : int
  name : string

fun isort( l : list<seki>, acc : list<seki> )
  match (l) {
    Cons(x, xs) -> isort(xs, acc.insert(x))
    Nil -> acc
  }

fun insert( l: list<seki>, e: seki )
  match (l) {
    Cons(x, xs) -> if(e.ord > x.ord) then Cons(e, l) else Cons(x, xs.insert(e) )
    Nil -> e.single
  }

fun sekigae( members: list<string> ) : random list<string>
  members.map( Seki(random-int(), _) ).isort([]).map(name)

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
