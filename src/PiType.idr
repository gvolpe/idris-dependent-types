module PiType

-- Dependent Function Type, also called Π-Type (Pi Type)

data DepProduct : (a : Type) -> (P : a -> Type) -> Type where
    MakeDepProduct : {P : a -> Type} -> ((x : a) -> P x) -> DepProduct a P

depType : Int -> Type
depType 0 = Int
depType 1 = String
depType _ = Bool

x : DepProduct Int (\n => depType n)
x = MakeDepProduct (\n => case n of
                             0 => 10
                             1 => "aaa"
                             2 => True)
