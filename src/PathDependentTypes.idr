module PathDependentTypes

-- Type will be determined based on the input value
isSingleton : Bool -> Type
isSingleton True = Nat
isSingleton False = List Nat

-- Using dependent type to determine the return type (dependent function)
mkSingle : (x : Bool) -> isSingleton x
mkSingle True = 0
mkSingle False = []

-- Using dependent type to determine the second parameter, that could be either Nat or List Nat
sum : (single : Bool) -> isSingleton single -> Nat
sum True x = x
sum False [] = 0
sum False (x :: xs) = x + sum False xs
