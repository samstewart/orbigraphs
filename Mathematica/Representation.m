(* ::Package:: *)

(* ::Subtitle:: *)
(*Group Representation Utilities*)


(* ::Text:: *)
(*Prelude*)


BeginPackage["Representation`"];

Representation::usage = "This package contains tools for working with representations of finite permutation groups."


(* ::Text:: *)
(*Exports*)


Representation::usage = "Representation[{rules}] denotes a representation of a finite group.";
GroupRepresentation::usage = "GroupRepresentation[g, opts] gives a standard representation of some common groups, or a regular representation if no standard representation is known.";
RegularRepresentation::usage = "RegularRepresentation[g] gives the left regular representation of g.";
TrivialRepresentation::usage = "TrivialRepresentation[g, n] gives the n-dimensional trivial representation of g.";
RepresentationCharacter::usage = "RepresentationCharacter[r] gives the character (vector of traces) of the representation r.";
RepresentationInnerProduct::usage = "RepresentationInnerProduct[r1, r2] gives the inner product of the characters of two G-representations weighted by the order of G.";
Res::usage = "Res[h,r] gives the restriction of the representation r to the subgroup h.";
Ind::usage = "Ind[g,r] gives the induction of the representation r to the group g.";

Begin["`Private`"];


(* ::Text:: *)
(*Utilities*)


LeftCosets[g_, h_] := Module[{coset, hs = GroupElements[h]},
	coset = a \[Function] DeleteDuplicates[PermutationProduct[a, #]& /@ hs];
	DeleteDuplicates[Composition[Sort, coset] /@ GroupElements[g]]
];

UnderlyingGroup[Representation[rs_]] := PermutationGroup[First /@ rs];

Representation[rs_][elem_] := elem /. rs;


(* ::Text:: *)
(*Creating Representations*)


RegularRepresentation[g_] := Module[{toRow, elementRep, elems = GroupElements[g]},
	toRow= h \[Function] elems /. {h -> 1, _Cycles -> 0};
	elementRep=h \[Function] Transpose[toRow[PermutationProduct[h, #]]& /@ elems];
	Representation[Rule[#, elementRep[#]]& /@ elems]
];

GroupRepresentation[g:CyclicGroup[n_], m_] := Representation@GroupElements[g] /. {
	e:Cycles[{}] :> (e -> IdentityMatrix[m]),
	a_Cycles :> (a -> DiagonalMatrix[ConstantArray[Exp[(2\[Pi] I)/n], m]])
};

GroupRepresentation[g_] := RegularRepresentation[g];

TrivialRepresentation[g_, m_] := Representation[Rule[#, IdentityMatrix[m]]& /@ GroupElements[g]];


(* ::Text:: *)
(*Modifying Representations*)


Res[h_, Representation[rs_]] := Module[{elems = GroupElements[h]},
	Representation[Thread[Rule[elems, elems /. rs]]]];

Ind[g_, r:Representation[rs_]] := Module[{h = UnderlyingGroup[r], dv = Length@Last@First@rs, reps, basis, xi, decompose, column, elemRep, pos, decomps, v, newv},
	reps = First /@ LeftCosets[g, h];
	basis = Partition[#, dv]& /@ Permutations[PadRight[{1}, dv * Length[reps]]];
	decompose = a \[Function] First@Select[Flatten[Outer[List, GroupElements[h], reps], 1], #[[2]]\[PermutationProduct]#[[1]] == a&];
	elemRep = a \[Function] Transpose[(
		pos = Position[#, 1];
		xi = reps[[pos[[1, 1]]]];
		decomps = decompose[a \[PermutationProduct] xi];
		v = r[decomps[[1]]].#[[pos[[1, 1]]]];
		newv = Table[0, {i, Length[reps]}, {j, dv}];
		newv[[Position[reps, decomps[[2]]][[1]]]] = v;
		Flatten[newv]
	)& /@ basis];
	Representation[Rule[#, elemRep[#]]& /@ GroupElements[g]]
];


(* ::Text:: *)
(*Computing with Representations*)


RepresentationCharacter[Representation[rs_]] := Composition[Tr, Last] /@ rs;

RepresentationInnerProduct[g_Representation, h_Representation] := (1/Length[First[g]] RepresentationCharacter[g].RepresentationCharacter[h]) /; UnderlyingGroup[g] == UnderlyingGroup[h];


End[];
EndPackage[];
