Spectra of Connected 2-Orbigraphs
=================================

**Claim:** If \\(G\\) and \\(H\\) are non-isomorphic connected 2-orbigraphs, they are not [[cospectral]].

**Proof sketch:** If \\(\\#(G) \neq \\#(H)\\) then the spectra cannot be the same. Therefore consider the case when \\(G\\) and \\(H\\) are both on \\(n\\) vertices.

Because \\(G\\) and \\(H\\) are connected 2-orbigraphs, they must both arise from equitable partitions of the \\(2\\)-tree by \\(n\\) colors. (See Daly 2013.) For each \\(n\\) there are four such equitable partitions (up to relabeling). These generate four orbigraphs. Because \\(G\\) and \\(H\\) are non-isomorphic, they must be two distinct graphs from this set of four. It then suffices to show that no pair of graphs in this set is cospectral.

The following image shows the set of four connected 2-orbigraphs on 3 vertices:

[[/Images/2on4types.png|width=200px|align=center]]

To show that none are cospectral, I will use [[CyclesCospectrality]]. First, I will count the 1-cycles. For Types I-IV there are resp. 0, 1, 1, 0. Hence if two graphs from the set are cospectral they must be a pair of Type II and III or a pair of type I and IV. Next, I will count the 2-cycles. Here for Types I-IV there are resp. \\(n+1\\), \\(n\\), \\(n-1\\), and \\(n\\). Hence no two graphs of Types II and III are cospectral and no two graphs of type I and IV are cospectral. Hence there is no pair of graphs from the set that is cospectral. \\(\square\\)

Notes
-----

This theorem is interesting because it agrees with a possible statement (and converse) of Sunada's Theorem for Orbigraphs. 

First observe that the automorphism group of the \\(2\\)-tree is isomorphic to \\(\mathbb{Z}\\). Any subgroup \\(H\\) is an infinite cyclic group with elements \\(\\{\ldots, -2k, -k, 0, k, 2k, \ldots\\}\\), where \\(k \in \mathbb{Z}\\). Suppose \\(H_1\\) and \\(H_2\\) are subgroups with generators \\(k_1\\) and \\(k_2\\) respectively, and consider \\( s = \\#([n] \cap H_1) \\) and \\( t = \\#([n] \cap H_2) \\) for \\(n \in \mathbb{Z}\\). Because \\(\mathbb{Z}\\) is Abelian, we have \\( [n] = \\{n\\} \\). Therefore \\( s = 1 \\) if \\(n \in H_1 \\) and \\( s = 0 \\) otherwise, and likewise for \\(t\\). But \\(n \in H_1 \\) only if \\( k_1 \mid n \\) and likewise for \\(H_2\\). Thus \\(s = t \\) for all \\(n\\) only if \\( k_1 \mid n \Leftrightarrow k_2 \mid n \\). But this is only true if \\( k_1 = k_2 \\). Hence \\( \mathbb{Z} \\) has pair of distinct subgroups that satisfy the Sunada condition. 

If it is true that any two cospectral orbigraphs are quotients of their common covering tree by groups that satisfy the Sunada Condition, then this theorem would be implied. 
