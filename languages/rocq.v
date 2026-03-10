Require Import PrimFloat.
Require Import Floats.
Require Import Extraction.
Require Import ExtrOcamlBasic.
Require Import ExtrOcamlNatInt.

Open Scope float_scope.

Record State : Set := mkState
	{ a : float
	; b : float
	; t : float
	; p : float
	}.

Definition pi_step (s : State) : State :=
	let a1 := (a s + b s) / 2 in
	mkState
		a1
		(sqrt (a s * b s))
		(t s - p s * (a1 - a s) * (a1 - a s))
		(p s * 2).

Fixpoint iterate (n : nat) (s : State) : State :=
	match n with
	| 0 => s
	| S n' => iterate n' (pi_step s)
	end.

Definition gauss_legendre (n : nat) : float :=
	let s := iterate (n) (mkState 1 (sqrt 0.5) 0.25 1) in
	(a s + b s) * (a s + b s) / (4 * t s).

Extraction "gauss_legendre.ml" gauss_legendre.