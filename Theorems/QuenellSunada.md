Quenell's Proof of the Sunada Theorem for Graphs
================================================

_This is a revised version of Quenell's proof of the Sunada theorem for Graphs (Quenell 2003)._

**Claim:** Let \\( \Gamma \\) be a finite, regular, undirected graph with a group of automorphisms \\( G \\) that acts freely. Let \\( H_1 \\) and \\( H_2 \\) be subgroups of \\( G \\) such that \\( (G, H_1, H_2) \\) is a [[Sunada triple | SunadaCondition]]. Then \\( spec \Gamma / H_1 = spec \Gamma / H_2 \\).

**Proof:** We will proceed by counting the number of closed n-walks in a quotient of \\( \Gamma \\) by a subgroup of \\( G \\) called \\( H \\). To do this, we will count the number of n-walks in \\( \Gamma \\) which project to closed walks in \\( \Gamma / H \\). We will then divide out the walks upstairs which map to the same walk downstairs.

Let \\( \gamma = v_0 e_0 \ldots e_n v_n \\) be an n-walk in \\( \Gamma \\). Clearly, if there is no element \\( g \in G \\) such that \\( g v_0 = v_n \\), then \\( \gamma \\) will not project to a closed walk. Therefore, we select a subset of the closed n-walks in \\( \Gamma \\) for which there is an element of \\( G \\) which maps the first vertex to the last vertex. Let \\( B_n \\) be this subset.

Now we partition \\( B_n \\) into orbits based on the action of \\( G \\). (\\( G \\) acts on walks by the standard action on their vertices.) We can write \\( B_n = B_{n1} \cup B_{n2} \ldots B_{nm} \\) where the \\( B_ni \\) are the orbits of \\( B_n \\) by \\( G \\). Let \\( \alpha_i \in B_ni \\) be any walk. By the definition of \\( B_n \\) there exists a \\( g_{\alpha_i} \\) such that if \\( \alpha_i = v_0 \ldots v_n \\) then \\( g_{\alpha_i} v_0 = v_n \\). 

Now consider an arbitrary element of \\( B_ni \\) which can be written as \\( g \alpha_i = g v_0 \ldots g v_n \\) for some \\( g \in G \\). I claim that the projection of \\( g \alpha_i \\) is closed if and only if \\( g g_{\alpha_i} g^{-1} \in H \\). First, assume that \\( g g_{\alpha_i} g^{-1} \in H \\). Then we have:
$$
\begin{align*}
(g g_{\alpha_i} g^{-1}) g v_0 =& g g_{\alpha_i} v_0
&= g v_n.
\end{align*}
$$
Hence there is an element \\( h \in H \\) such that \\( h g v_0 = g v_n \\) so the projection of \\( g \alpha_i \\) will be closed. On the other hand, assume that the projection of \\( g \alpha_i \\) is closed. Then there must be an element \\( h \in H \\) such that \\( h g v_0 = g v_n \\). Then we have:
$$
\begin{align*}
h g v_0 &= g v_n \\\\
&= g g_{\alpha_i} v_0.
\end{align*}
$$
This implies that 
$$
h v_0 = g g_{\alpha_i} g^{-1} v_0,
$$
and
$$
v_0 = h^{-1} g g_{\alpha_i} g^{-1} v_0.
$$
Because \\( h^{-1} g g_{\alpha_i} g^{-1} \in G \\) and \\( G \\) acts freely, it must be that \\( h^{-1} g g_{\alpha_i} g^{-1} = e \\), so \\( g g_{\alpha_i} g^{-1} = h \in H \\).

Hence, the number of n-walks in \\( \Gamma \\) which project to a closed walk in \\( \Gamma / H \\) is equal to \\( \sum_i \\#({g : g g_{\alpha_i}} g^{-1} \in H) \\). By the [[ConjugacyCounting]] we have that \\( \\#({g : g g_{\alpha_i}} g^{-1} \in H) = \\#(C(g_{\alpha_i})) \cdot \\#([g_{\alpha_i}] \cap H) \\). Hence the total number of n-walks which project to a closed walk in \\( \Gamma / H \\) is
$$
\sum_i \\#(C(g_{\alpha_i})) \cdot \\#([g_{\alpha_i}] \cap H).
$$

To determine how many closed n-walks there are in \\( \Gamma / H \\) we must divide this number by \\( \\#(H) \\) because each walk in \\( \Gamma / H \\) lifts to exactly \\( \\#(H) \\) walks in \\( \Gamma \\). (This is because the action of \\( H \\) is free, so acting on a walk by any element of H gives a unique new walk.)

Therefore the number of closed walks in \\( \Gamma / H \\) is 
$$
\frac{1}{\\#(H)} \sum_i \\#(C(g_{\alpha_i})) \cdot \\#([g_{\alpha_i}] \cap H).
$$
By [[SunadaImpliesSameOrder]], the two Sunada subgroups \\( H_1 \\) and \\( H_2 \\) have the same order and the numbers \\( \\#([g_{\alpha_i}] \cap H_1) \\) and \\( \\#([g_{\alpha_i}] \cap H_2) \\) are equal for all \\( g_{\alpha_i} \\) by the Sunada condition. Therefore, \\( \Gamma / H_1 \\) and \\( \Gamma / H_2 \\) have the same number of closed n-walks for all \\( n \\) and are cospectral by [[CyclesCospectrality]].
