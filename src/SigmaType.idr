module SigmaType

import Data.Vect

-- Dependent Pair Type, also called Σ-Type (Sigma Type)

depType : Int -> Type
depType 0 = Int
depType 1 = String
depType _ = Bool

data DepPair : (a : Type) -> (P : a -> Type) -> Type where
    MakeDepPair : {P : a -> Type} -> (x : a) -> P x -> DepPair a P

x : DepPair Int (\n => depType n)
x = MakeDepPair 0 10

y : DepPair Int (\n => depType n)
y = MakeDepPair 1 "abc"

z : DepPair Int (\n => depType n)
z = MakeDepPair 2 True

-- Using syntax sugar for DPair is (a : A ** P)
vec : (n : Nat ** Vect n Int)
vec = (2 ** [3, 4])

-- Using data type constructor (DPair is the type defined in Idris)
vec2 : DPair Nat (\n => Vect n Int)
vec2 = MkDPair 2 [3, 4]

-- Type inference of first argument (how cool!)
vec3 : (n : Nat ** Vect n Int)
vec3 = (_ ** [3, 4])

-- We can even omit the type of the argument n
vec4 : (n ** Vect n Int)
vec4 = (_ ** [3, 4])
