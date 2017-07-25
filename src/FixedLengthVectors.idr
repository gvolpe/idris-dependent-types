module FixedLengthVectors

-- Vectors are like "lists with length"
data Vect : Nat -> Type -> Type where
   Nil  : Vect Z a
   (::) : a -> Vect k a -> Vect (S k) a

-- Here the return type is defined based on the sum of the length of each vector 
(++) : Vect n a -> Vect m a -> Vect (n + m) a
(++) Nil       ys = ys
(++) (x :: xs) ys = x :: xs ++ ys

-- This implementation, for example, will not compile
-- (++) : Vect n a -> Vect m a -> Vect (n + m) a
-- (++) Nil       ys = ys
-- (++) (x :: xs) ys = x :: xs ++ xs -- BROKEN
