(* ::Package:: *)

(* ::Subtitle:: *)
(*Cover Construction Package*)


(* ::Text:: *)
(*Standard prelude*)


BeginPackage["OrbigraphCovers`"];

OrbigraphCovers::usage = "Code for constructing finite cover for orbigraphs";


(* ::Text:: *)
(*Exports*)


SpectralGap::usage = "SpectralGap[adj_] Computes the sepctral gap of the spectrum of an adjacency matrix";
CreateFiniteCoveringGraph::usage = "CreateFiniteCoveringGraph[orbi_Graph] Creates a finite covering from a good orbigraph represented as a graph";
CreateFiniteCovering::usage = "CreateFiniteCover[orbi_] Creates a finite covering from an orbigraph adjacency matrix";

Begin["`Private`"];


(* ::Text:: *)
(*Utility Methods*)


Needs["Orbigraphs`"];
Needs["MarkovOrbigraphs`"];

(* Converts the stationary vector to a vector of integers *)
IntegerizeStationaryVector[orbi_] := # / GCD@@#& @(ComputeStationaryVector @ MarkovProcessFromOrbigraph @ orbi );

DiagonalBlockMatrix[diagm_, {rows_Integer, cols_Integer}] := SparseArray[Band[{1,1}, {rows,cols}]-> {diagm}];

PartitionSizes[orbi_] := With[{ stat = IntegerizeStationaryVector[orbi]}, stat * FindConstantMultiple[orbi, stat]];




(* Creates the appropriate submatrix. I'd like to use some more pattern matching*)
CreateSubMatrix[orbi_, i_Integer, j_Integer] :=
	If[i == j, 
		FillInnerConnections[orbi, i], 
		FillCrossConnections[orbi, i, j]
	];

(* Constructs the entire matrix for the cover.*)
CreateFiniteCovering[orbi_] := Module[
	{
		pnum = First@Dimensions@orbi
	},
	(* Group all the matrices into the proper rows and columns so that we have the proper final matrix*)
	ArrayFlatten[
		(* group into rows so that we can combine into a single array*)
		Partition[
			Map[
				(* Convert sparse array into normal matrix for each combo of partition indices*)
				(Normal@CreateSubMatrix[orbi,First@#, Last@#])&, 
				(* go through all combos of partitions and construct submatrices*)
				Tuples[{
					Range@pnum,
					Range@pnum
				}]
			], 
		pnum]
	]
];



(* Checks to see if the graph is k-regular*)
IsKRegular[k_Integer, adj_List]:= And@@((Total[#] == k)& /@ Join[adj, Transpose@adj])

(* Finds the spectral gap of a matrix with dimensions > 2*)
SpectralGap[adj_List] := Block[
	{
		spectrum = Sort[DeleteDuplicates[Abs[Eigenvalues@adj]], Greater]
	},
	If[Length@spectrum == 1,
		-Infinity,
		spectrum[[1]] - spectrum[[2]]
	]
]




(* ::Text:: *)
(*Cover Construction*)



(* Finds the constant multiple for creating the cover *)
FindConstantMultiple[orbi_, stationary_List] :=
LCM@@Flatten[
	MapIndexed[
		With[{i = First@#2, j = Last@#2, incoming = orbi[[Last@#2,First@#2]]+KroneckerDelta[First@#2, Last@#2]},
			If[incoming == 0 || Divisible[stationary[[i]], incoming] ,
				1, (*if the current number of vertices is already a multiple, just ignore us*)
				incoming (*otherwise you should be a multiple of the number of necessary edges*)
			]
		]&,
		orbi,
		{2}
	],
1]


(* Fills in the "cross-partition" connections between partition i and j. Pattern matching to avoid being called on the diagonal?*)
FillCrossConnections[orbi_, src_Integer, dst_Integer] := Module[
	{
		partsizes = PartitionSizes[orbi], 
		orisizes = IntegerizeStationaryVector[orbi]
	},

	(* map over all partitions and make the appropriate connections*)
	Return[
		(*now we permute the connections a bit to ensure the resulting graph is connected*)
		EnsureConnected[
			(* now we stamp this along the diagonals of a matrix*)
			DiagonalBlockMatrix[
				(* We can tile after we have the proper number of vertices from the other partitions connecting to us (self contained unit)*)
				ConstantArray[1, { orbi[[dst, src]], orbi[[src, dst]] } ],
				{partsizes[[src]],partsizes[[dst]]}
			],
			{src, dst}
		]
	]
];

(* Fills in the "inner-partition connections in partition i. Hope we chose c correctly! Pattern matching to avoid being called across connections?*)
FillInnerConnections[orbi_, part_Integer] := Module[
	{
		partsizes = PartitionSizes[orbi], 
		orisizes = IntegerizeStationaryVector[orbi]},
	Return[

		(*we create a matrix with the proper connections then stamp it out along the diagonal*)
		DiagonalBlockMatrix[
			ConstantArray[1, { orbi[[part,part]] + 1,orbi[[part,part]] + 1}] - IdentityMatrix[orbi[[part, part]] + 1],
			{ partsizes[[part]], partsizes[[part]] }
	]
	]
];

(* Creates the index partitions in the matrix for reference. Can I clean this up with pattern matching? I should read more mathematica code to get better at it. There must be a cleaner way to generate the partions! Maybe a fold?*)
CreateIndexPartitions[orbi_] :=
	Apply[
		Range,
		(* we trim the first entry off because it is merely the seed value {{0,0}}*)
		Drop[
			Fold[
				Append[#1, 
					{
						Last@Last@#1 + 1, Last@Last@#1  + #2
					}
				]&, 
				{{0,0}}, 
				PartitionSizes@orbi
			],
		1],
1];

(*Flips first and last outgoing edges deterministically. Better pattern matching? Operates only *cross-connection* matrix.
We do some sneaky business with the transposes to get a column permutation instead of a row permutation. We leave the matrix untouched
if we can't safely do a permutation. We flip rows or columns depending on the ordering of the two partition indices*)
EnsureConnected[connexions_,{src_Integer, dst_Integer}] :=
With[
	{
		dim = Dimensions@connexions,
		rows=First@Dimensions@connexions, 
		col = Last@Dimensions@connexions
	},
	If[And @@ Thread[dim > {1,1}],
		(* if the src partition index is smaller, we need to flip rows, otherwise we flip columns to maintain symmetry. I think you could do either way
as long as you flip it?*)
		If[ src < dst,
			connexions[[
				Join[
					List@rows ,
					Range[2,rows - 1],
					List@1
				]
			]],
		(* otherwise we flip columns*)
		Transpose[
			Transpose[connexions][[
				Join[
					List@col ,
					Range[2, col - 1],
					List@1
				]
			]]]
		],
		(*leave unchanged if we don't have enough to flip*)
		connexions
	]
];

CreateFiniteCoveringGraph[orbi_] := 
With[
	{
		g = AdjacencyGraph[CreateFiniteCovering[orbi], VertexSize->.2]
	},
	HighlightGraph[
		g, 
		(part \[Function]Subgraph[g, part])/@ CreateIndexPartitions[orbi]
	]
];


End[];
EndPackage[];
