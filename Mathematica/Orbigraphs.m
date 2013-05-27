(* ::Package:: *)

(* ::Subtitle:: *)
(*Orbigraph Utilities Package*)


(* ::Text:: *)
(*Standard prelude*)


BeginPackage["Orbigraphs`"];

Orbigraphs::usage = "Some utilities for working with Orbigraphs.";


(* ::Text:: *)
(*Exports*)


OrbigraphQ::usage = "OrbigraphQ[adj] determines if adj represents an orbigraph.";
EnumerateOrbigraphs::usage = "EnumerateOrbigraphs[n, k] returns a list of all k-orbigraphs on n vertices.";
AdjacencyOrbigraph::usage = "AdjacencyOrbigraph[adj] returns a weighted graph representing the orbigraph given by adj.";
OrbigraphSpectrum::usage = "OrbigraphSpectrum[g] returns the spectrum of the orbigraph g.";
SurelyBadOrbigraphQ::usage = "SurelyBadOrbigraphQ[adj] determines if the orbigraph given by adj is provably bad.";
SurelyBadOrbigraphs::usage = "SurelyBadOrbigraphs[n, k] returns a list of k-orbigraphs on n vertices that are provably bad.";
CompletePartition::usage = "CompletePartition[g, pi] returns the partition pi with singletons added for each vertex of g not yet listed.";
OrbigraphFromPartition::usage = "OrbigraphFromPartition[g, pi] returns an orbigraph generated by the equitable partition pi of the graph g.";
OrbigraphFromGroup::usage = "OrbigraphFromGroup[g, \[CapitalGamma]] returns the orbigraph g/\[CapitalGamma].";
CycleCount::usage = "CycleCount[g, n] returns the number of cycles of length n in g.";
CycleSpectrum::usage = "CycleSpectrum[g, n] returns the first n elements of the cycle spectrum of g.";
CycleCospectralQ::usage = "CycleCospectral[g1, g2] determines if the graphs g1 and g2 have the same length spectrum.";
DeleteIsomorphicGraphs::usage = "DeleteIsomorphicGraphs[gs] returns one representative from each equivalence class of gs with equivalence determined by graph isomorphism.";
GraphQuotient::usage = "GraphQuotient[g, h] gives the standard quotient graph g/h.";
CollapseOrbigraph::usage = "CollapseOrbigraph[g] returns a new graph by removing weights from all but self loops.";
GraphAutomorphismGroup::usage = "GraphAutomorphismGroup[g] finds the group of automorphisms of the graph g."
ImportRegularGraphs::usage = "ImportRegularGraphs[n, k] attemts to retrieve the set of k-regular graphs on n vertices from the data hosted at http://www.mathe2.uni-bayreuth.de.";
ConjugacyClass::usage = "ConjugacyClass[x, g] returns the conjugacy class of the element x in the group g.";
SunadaQ::usage = "SunadaQ[g, h1, h2] determines whether the triple (g, h1, h2) satisfies the Sunada condition.";
PartialKTree::usage = "PartialKTree[k, l] builds a k-regular tree up to l levels deep, with only the leaves having degree 1.";

Begin["`Private`"];


(* ::Text:: *)
(*Basic operations with Orbigraphs*)


OrbigraphQ[adj_] := Module[{n=Length[adj]},
	And@@Flatten[Table[Table[(adj[[r,c]] == 0) == (adj[[c,r]] == 0), {c, r+1, n}], {r, 1, n-1}]]
];

EnumerateOrbigraphs[n_,k_] := Select[Tuples[Flatten[Map[Permutations, PadRight[#, n] & /@ IntegerPartitions[k,n], {1}], 1], n], OrbigraphQ];

OrbigraphSpectrum[g_] := Eigenvalues[WeightedAdjacencyMatrix[g]];


(* ::Text:: *)
(*Representing Orbigraphs as Mathematica Graphs*)


AdjacencyOrbigraph[mat_] := WeightedAdjacencyGraph[mat /. {0 -> \[Infinity]}, DirectedEdges -> True, EdgeLabels -> "EdgeWeight"];


(* ::Text:: *)
(*Good/Bad orbigraphs and related things*)


SurelyBadOrbigraphQ[orbi_] := MemberQ[Eigenvalues[orbi], _Complex];

SurelyBadOrbigraphs[n_,k_] := Select[EnumerateOrbigraphs[n, k], SurelyBadOrbigraphQ];


(* ::Text:: *)
(*Constructing Orbigraphs*)


CompletePartition[g_, pi_] := Module[{excluded, p},
	excluded = Complement[Range[VertexCount[g]], Flatten[pi]];
	Join[pi, List /@ excluded]
];

OrbigraphFromPartition[g_, pi_] := Module[{mat, p},
	p = CompletePartition[g, pi];
	mat = Table[EdgeCount[g, First[p[[i]]] \[UndirectedEdge] b_ /; MemberQ[p[[j]], b]], {i, Length[p]}, {j, Length[p]}];
	Return[AdjacencyOrbigraph[mat]]
];

OrbigraphFromGroup[g_, \[CapitalGamma]_] := OrbigraphFromPartition[g, GroupOrbits[\[CapitalGamma], VertexList[g]]]


(* ::Text:: *)
(*Useful graph theoretic operations*)


CycleCount[g_Graph, n_] := Tr[MatrixPower[WeightedAdjacencyMatrix[g], n]];

CycleSpectrum[g_Graph, n_] := Table[CycleCount[g, k], {k, 1, n}];

CycleCospectralQ[g_Graph, h_Graph] := And@@Table[CycleCount[g, n] == CycleCount[h, n],{n, 0, Max[VertexCount[g], VertexCount[h]]}];

DeleteIsomorphicGraphs[gs_] := Module[{k,i,j, cleaned={}, found},
	For[i = 1, i <= Length[gs], i++,
		found = False;
		For[j=1, j <= Length[cleaned], j++, 
			If[IsomorphicGraphQ[gs[[i]], cleaned[[j]]], 
				found = True; Break[],
				Continue[]];
		];
		If[!found, AppendTo[cleaned, gs[[i]]], Continue[]];
	];
	Return[cleaned]
];

GraphAutomorphismGroup[g_Graph] := Block[{$ContextPath, cg},
	Needs["Combinatorica`"];
	Needs["GraphUtilities`"];
	cg = GraphUtilities`ToCombinatoricaGraph[g];
	PermutationGroup[FindPermutation /@ Combinatorica`Automorphisms[cg]]
];


(* ::Text:: *)
(*Manipulating the standard graph quotient*)


CartesianProduct[xs_List,ys_List]:=Flatten[Outer[List, xs, ys], 1];

OrbitEdges[e_,H_]:=Flatten[Outer[List, (PermutationReplace[e[[1]], H] // Flatten), e[[2]]], 1];

OrbitConnected[es_, \[CapitalGamma]_] := Or@@(EdgeQ[\[CapitalGamma], UndirectedEdge@@##]& /@ es);

GraphQuotient[\[CapitalGamma]_, H_] := Module[{os, ocount, pairs, oes},
	os = GroupOrbits[H, VertexList[\[CapitalGamma]]];
	ocount = Length[os];
	pairs = Flatten[Outer[List, Range[ocount], Range[ocount]], 1] /. n_Integer :> os[[n]];
	Graph[UndirectedEdge@@@DeleteDuplicates[Sort /@ Select[pairs, OrbitConnected[OrbitEdges[#, H], \[CapitalGamma]]&]], VertexLabels -> "Name"]
];

CollapseOrbigraph[\[CapitalGamma]_] := WeightedAdjacencyGraph[
	(MapIndexed[If[#2[[1]] == #2[[2]], #1, Boole[#1 > 0]] &, WeightedAdjacencyMatrix[\[CapitalGamma]], {2}]) /. {0 -> \[Infinity]}, 
	DirectedEdges -> False, EdgeLabels -> "EdgeWeight"];


(* ::Text:: *)
(*Utilities for parsing shortcode k-regular graph descriptions*)


SeparateCodeSegments[bin_, n_, k_] := Module[{codes = {{}}, recall = True},
	For[i=1, i <= Length[bin], i++,
		If[recall,
			If[Length[codes] > 1, codes[[-1]] = codes[[-2, 1;;bin[[i]]]]],
			AppendTo[codes[[-1]], bin[[i]]]
		];
		recall = False;
		If[Length[codes[[-1]]] == n*k/2, 
			AppendTo[codes,{}]; recall = True
		];
	];
	Drop[codes, -1]
];

DecodeGraph[seq_, n_, k_] := Module[{i, j, adjacents, edges},
	adjacents = ConstantArray[0, n];
	edges = {};
	j = 1;
	For[i = 1, i <= Length[seq], i++,
		adjacents[[j]]++;
		adjacents[[seq[[i]]]]++;
		AppendTo[edges, j \[UndirectedEdge] seq[[i]]];
		If[adjacents[[j]] == k, j++];
	];
	Graph[DeleteDuplicates[edges]]
];

GraphsFromShortcode[bin_, n_, k_] := DecodeGraph[#, n, k]& /@ SeparateCodeSegments[bin, n, k];

ImportRegularGraphs[n_, k_] := ImportRegularGraphs[n, k] = Module[{nstr, url, bin},
	nstr = If[n < 10, "0" <> ToString[n], ToString[n]];
	url = "http://www.mathe2.uni-bayreuth.de/markus/REGGRAPHS/SCD/" <> nstr <> "_" <> ToString[k] <> "_3.scd";
	bin = Quiet[Import[url, "Binary"]];
	GraphsFromShortcode[bin, n, k]
]


(* ::Text:: *)
(*Group theoretic operations*)


ConjugacyClass[x_, \[CapitalGamma]_] := DeleteDuplicates[# \[PermutationProduct] x \[PermutationProduct] InversePermutation[#]& /@ GroupElements[\[CapitalGamma]]];

SunadaQ[g_, h1_, h2_] := Module[{h1s=GroupElements[h1],h2s=GroupElements[h2]},
	And@@(Length[Intersection[ConjugacyClass[#, g], h1s]] == Length[Intersection[ConjugacyClass[#, g], h2s]]& /@ GroupElements[g])
];


(* ::Text:: *)
(*Building partial k-regular trees*)


ExtendVertex[tree_, vert_, n_, idx_] := EdgeAdd[tree, Table[vert \[UndirectedEdge] j, {j, idx, idx + n - 1}]];

ExtendKTree[tree_, k_] := Module[{t = tree, idx = Max[VertexList[tree]] + 1, extend, j, add},
	extend=Select[VertexList[t], VertexDegree[t,#] < k &];
	For[j = 1, j <= Length[extend], j++,
		add = k - VertexDegree[t, extend[[j]]];
		t = ExtendVertex[t, extend[[j]], add, idx];
		idx += add;
	];
	Return[t];
];

PartialKTree[k_, l_] := Nest[ExtendKTree[#, k] &, Graph[{1}, {}, VertexLabels -> "Name", GraphLayout -> "RadialDrawing"], l];


End[];
EndPackage[];
