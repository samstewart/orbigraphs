(* ::Package:: *)

(* ::Subtitle:: *)
(*Markov-Orbigraph Utilities Package*)


(* ::Text:: *)
(*Standard prelude*)


BeginPackage["MarkovOrbigraphs`"];

MarkovOrbigraphs::usage = "Some utilities for working with Markov Chains and orbigraphs.";


(* ::Text:: *)
(*Exports*)


IsRealSpectrumQ::usage = "IsRealSpectrumQ[adj_] Checks to see if the adjacency spectrum contains only real values";
IsComplexSpectrumQ::usage = "IsComplexSpectrumQ[adj_] Checks to see if the adjacency spectrum contains any complex values";
ConnectedOrbigraphQ::usage = "ConnectedOrbigraphQ[adj_] Checks to see if the orbigraph is connected";
EnumerateConnectedOrbigraphs::usage = "";
DisplayOrbigraphs::usage = "";
DisplayMarkovProcesses::usage = "";
MarkovReversibleQ::usage = "";
MarkovIrreducibleQ::usage = "";
MarkovProcessFromOrbigraph::usage = "";
ComputeStationaryVector::usage = "";
GoodOrbigraphQ::usage = "";
OrbigraphReversibleQ::usage = ""
BadOrbigraphQ::usage = "";
EnumerateBadOrbigraphs::usage = "";
EnumerateGoodOrbigraphs::usage = "";
Begin["`Private`"];

Needs["Orbigraphs`"];


(* ::Text:: *)
(*Spectrum Queries*)


IsRealSpectrumQ[adj_] := FreeQ[Eigenvalues[adj], _Complex];

IsComplexSpectrumQ[adj_] := Not @ IsRealSpectrumQ @ adj;

ConnectedOrbigraphQ[adj_] := ConnectedGraphQ @ AdjacencyOrbigraph[adj];

MarkovReversibleQ[proc_DiscreteMarkovProcess] := MarkovProcessProperties[proc, "Reversible"];

MarkovIrreducibleQ[proc_DiscreteMarkovProcess] := MarkovProcessProperties[proc, "Irreducible"];

MarkovProcessFromOrbigraph[adj_] := DiscreteMarkovProcess[RandomReal[{0,1},First @ Dimensions@ adj], 1 / Total[First @ adj] * adj];


(* ::Text:: *)
(*Orbigraph to Markov Process*)


MarkovReversibleQ[proc_DiscreteMarkovProcess] := MarkovProcessProperties[proc, "Reversible"];

MarkovIrreducibleQ[proc_DiscreteMarkovProcess] := MarkovProcessProperties[proc, "Irreducible"];

OrbigraphReversibleQ[orbi_] := MarkovReversibleQ@MarkovProcessFromOrbigraph@orbi;

MarkovProcessFromOrbigraph[adj_] := DiscreteMarkovProcess[RandomReal[{0,1}, First@Dimensions@adj], 1 / Total[First @ adj] * adj];


(* ::Text:: *)
(*Utility Methods*)


ComputeStationaryVector[proc_DiscreteMarkovProcess] := #&@Normalize[#[[2,First@First@Position[First@#,1]]]&@Eigensystem[Transpose @ MarkovProcessProperties[proc, "TransitionMatrix"]], Total]

GoodOrbigraphQ[orbi_] := MarkovReversibleQ[orbi];

BadOrbigraphQ[orbi_] := Not[GoodOrbigraphQ[orbi]];

EnumerateBadOrbigraphs[n_Integer, k_Integer] := Select[EnumerateConnectedOrbigraphs[n, k], BadOrbigraphQ];

EnumerateGoodOrbigraphs[n_Integer, k_Integer] := Select[EnumerateConnectedOrbigraphs[n, k], GoodOrbigraphQ];

EnumerateConnectedOrbigraphs[n_Integer, k_Integer] := Select[EnumerateOrbigraphs[n, k], ConnectedOrbigraphQ]

DisplayOrbigraphs[orbis_List] := AdjacencyOrbigraph /@ orbis;

DisplayMarkovProcesses[procs_List] := Graph /@ procs;


End[];
EndPackage[];
