Meeting Notes for May 21
========================

We discussed two subjects today: Quinell's proof of the Sunada condition on graphs and the fact that the [[spectral radius]] of *any* [[Orbigraph]] of degree \\(k\\) is \\(k\\). We had hoped to cover our poster on fundamental groups but decided to postpone it until we delve into Bass-Serre theory. 

Quninell's Proof
----------------
Colin started the meeting by stepping through Quenell's Proof of the Sunada condition on graphs where Quenell's variant of the statement is the following:

Let \\(\Gamma\\) be a k-regular graph with group \\(G\\) acting on \\(\Gamma\\) by automorphisms. Then if \\(H_1\\) and \\(H_2\\) are subgroups of \\(G\\) that satisfy the Sunada conditon, then \\(spec \Gamma / H_1 = spec \Gamma / H_2\\). Colin discussed a few "sticking points" in the proof:

1. Why divide by \\(\\#(H)\\) where \\(H\\) is an arbitrary subgroup? We need to remove the symmetries produced by \\(H\\) on the NBT walks to avoid overcounting.
2. We also had trouble with the edge weights of "downstairs" graph (the quotient graph) since Quenell did not specify any. However, we remedied this problem by adding the appropriate number of edge weights. In particular, self-loops should be weighted.
3. There was some confusion on the factor \\(\\#(C)\\) where \\(C\\) is the centralizer (hand waves).

Spectral Radius of an Orbigraph
-------------------------------
Sam presented his proof that the spectral radius \\(\rho(O)\\), where \\(O\\) is an k-orbigraph, is equal to \\(k\\). Previously, he had managed to prove this fact for only strongly connected Orbigraphs but has now generalized it to disconnected orbigraphs as well. He still has a small bound to prove.