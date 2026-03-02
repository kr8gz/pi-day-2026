with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Main is
    function Gauss_Legendre (Iterations : Integer) return Float is
        A, B, P, T, An, Bn, Pn, Tn : Float;
    begin
        A := 1.0;
        B := 1.0 / Sqrt (2.0);
        P := 1.0;
        T := 0.25;

        for I in 1..Iterations loop
            An := A;
            Bn := B;
            Pn := P;
            Tn := T;

            A := (An + Bn) / 2.0;
            B := Sqrt (An * Bn);
            T := Tn - Pn * (An - A) ** 2;
            P := 2.0 * Pn;
        end loop;

        return (A + B) ** 2 / (4.0 * T);
    end Gauss_Legendre;
begin
    Put (Gauss_Legendre (10));
    New_Line;
end Main;