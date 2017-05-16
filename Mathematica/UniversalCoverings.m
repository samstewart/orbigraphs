(* ::Package:: *)

(* ::Subtitle:: *)
(*Universal Covering Package*)


(* ::Text:: *)
(*Standard prelude*)


BeginPackage["UniversalCovering`"];

UniversalCovering::usage = "Generates universal coverings for orbigraphs";

CreateUniversalCovering::usage = "CreateUniversalCovering[g_,n_,v_ : None] Creates a universal covering of depth n_ from orbigraph g_";
PartialUniversalCovering::usage = "Sam's implementation of creating a universal covering";

Needs["Orbigraphs`"];


(* ::Text:: *)
(*Exports*)


Begin["`Private`"];


(* ::Text:: *)
(*Colin's Implementation*)


UniqueEdges[g_]:=Module[
	{ 
	adj = WeightedAdjacencyMatrix @ g 
	},
	Flatten[
		Table[
			{#, n},
			{ n, adj[[#[[1]], #[[2]]]] }
		]&/@ EdgeList[g], 
		1
	]
];

StepsFrom[v_, es_] := List /@ Select[es, #[[1,1]] == v &];

RemoveRedundantSteps[w_, sts_] := 
Module[{ cameFrom, toDelete },
			cameFrom = Last[w][[1,1]];
			toDelete = Position[sts, x_List /; x[[1,1,2]] == cameFrom, 1][[1,1]];
			Delete[sts, toDelete]
];

ExtendWalk[w_,es_] := Join[w, #] &/@ RemoveRedundantSteps[
			w, 
			StepsFrom[
				Last[w][[1,2]],
				es
			]
		];

ExtendWalks[ws_,es_] := Flatten[
	ExtendWalk[#,es] &/@ ws,
1];

(* List all possible walks from base point v_ with edges es_ *)
ListWalks[v_, es_, 0] := {{}};
ListWalks[v_, es_, n_] := Prepend[
	Flatten[
		NestList[
			ExtendWalks[#, es] &,
			StepsFrom[v,   es],
			n-1],
		1],
	{}];
(* Checks if two walks are the same except for one extra edge*)
WalksAreAdjacentQ[w1_,w2_] := Length[w2] - Length[w1]==1 && Take[w2,Length[w1]] == w1;


ConvertWalksToEdgeList[ws_] := Select[
	Flatten[
		Outer[
			UndirectedEdge,
			ws,ws,
			1],
	1],
	WalksAreAdjacentQ @@ #&
];

(* Set a property on the graph*)
SetCoverProperty[g_,vs_,p_,v_] := Module[{props},
	props = DeleteCases[ # -> 
		If[ # == {},
			None,
			PropertyValue[{ g, Last[#][[1,2]] }, p]] & /@ vs,
			_ -> None
		];
	props = Append[
				props, 
				{} -> PropertyValue[{g,v}, p]
			];
	Return[props];
];

MergeOptions[opts_] := 
If[Length[#] > 1,
	#[[1,1]] -> 
		Join[
			#[[1,2]], 
			#[[2,2]]
		], 
	#[[1]]
]& /@ GatherBy[Union @@ opts, First];

CreateUniversalCovering[g_, n_, v_ : None] := Module[
	{
		es = UniqueEdges[g],
		gs,
		vertices,
		edges,
		shapes,
		styles
	},
	If[ v == None,
		gs = CreateUniversalCovering[g, n, First@#]& /@ ConnectedComponents[g];
		If[Length[gs] == 1, Return@First@gs];
		Return[
			GraphUnion[
				Sequence@@gs,
				MergeOptions[Options/@gs]
			]
		]
	];

	vertices = ListWalks[v, es, n];

	edges = ConvertWalksToEdgeList[vertices];

	styles = SetCoverProperty[g, vertices, VertexStyle,v];

	shapes = SetCoverProperty[g, vertices, VertexShapeFunction,v];

	If[Length[vertices] > 1,
		{vertices,edges,styles,shapes} = {vertices,edges,styles,shapes} /. {} -> {v}];
		Graph[
			vertices, 
			edges, 
			VertexStyle -> styles, 
			VertexShapeFunction -> shapes, 
			GraphLayout -> "RadialEmbedding"
		]
];


(* ::Text:: *)
(*Sam's Implementation*)


OrbigraphVertexWeight[orbi_Graph, v_] := Total[WeightedAdjacencyMatrix[orbi][[v]]];

(* Expands a single vertex into all of its appropriate neighbors*)
ExpandCoveringVertex[tree_, v_,orbi_,styles_, types_, idx_] :=
	Module[{add, t = tree,tps = types, i = idx, di = VertexDegree[tree, v], dsts = Flatten[Position[orbi[[types[v]]],x_/;x> 0], 1]},
		Return[
			{
			({t, tps, i} = ExpandCoveringVertexType[t,v, orbi, styles, #, tps, i];)&/@dsts;
			t,
			tps,
			i
			}
		]
]

OrbigraphStyles[orbi_Graph] := {PropertyValue[{orbi, #}, VertexShapeFunction], PropertyValue[{orbi, #}, VertexStyle]} &/@ VertexList@orbi;

OrbigraphTypeTable[orbi_Graph] := Module[{types},
	(types[#] = #) &/@ (VertexList@orbi);
	Return[types]
]

ExtendUniversalCovering[tree_Graph, orbi_,styles_, types_, k_Integer] := Module[{
	t = tree, 
	idx = Max[VertexList[tree]] + 1, 
	ot = types, 
	toextend = Select[VertexList[tree], 
	VertexDegree[tree,#] < k &]
},
({t, ot, idx} = ExpandCoveringVertex[t, #, orbi, styles, ot, idx];)&/@toextend;
	Return[{t, ot}];
];

(* Expands all the neighbors of a particular type*)
ExpandCoveringVertexType[tree_, v_, orbi_, styles_, type_, types_,idx_]:=
	Block[{ts = types, tr = tree, needed = orbi[[types[v], type]] - Length@Select[AdjacencyList[tree, v], types[#] == type&] },
	{
		(
		ts[#] = type;
		tr = EdgeAdd[tr, v \[UndirectedEdge]#];
		tr = SetProperty[{tr, #},VertexShapeFunction-> First@styles[[type]]];
		tr = SetProperty[{tr, #},VertexStyle-> Last@styles[[type]]];
		)& /@ Range[idx, idx + needed - 1]; 
	tr,
	ts,
	idx + needed
}
]

PartialUniversalCovering[orbi_Graph, d_Integer] := Block[
{
	k = OrbigraphVertexWeight[orbi, First @ VertexList @ orbi],
	types = OrbigraphTypeTable[orbi],
	styles = OrbigraphStyles[orbi],
	adj =  Normal @ WeightedAdjacencyMatrix @ orbi
},
Block[
{init = Graph[{1}, {}, EdgeStyle->Large, VertexSize-> .2, VertexShapeFunction -> {1 -> First@First@styles}, VertexStyle -> {1 -> Last@First@styles}, GraphLayout ->"RadialEmbedding"]},
	First@Nest[
		ExtendUniversalCovering[First@#,adj,styles, Last@#, k]&,{init, types}, d]
	]
]


End[];
EndPackage[];
