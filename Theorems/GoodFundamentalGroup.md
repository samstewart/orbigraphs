Fundamental Group of a Good Orbigraph
=====================================

Let $ \Gamma $ be a k-regular graph with automorphism subgroup $ H $ and let $ \mathcal{O} $ be the [[orbigraph | Orbigraph]] given by $ \Gamma / H $. By definition $ \mathcal {O} $ is a good orbigraph. We will now define the fundamental group of $ \mathcal{O} $ in terms of its covering graph $ \Gamma $.

We will assume that $ \Gamma $ is a Serre-type graph, in which each undirected edge is represented by a pair of directed edges. Each edge $ e $ then has a reverse edge $ \bar e $. Also, there are maps $ \delta_0, \delta_1 : E(\Gamma) \to V(\Gamma) $ such that $ \delta_0 $ gives the origin of an edge and $ \delta_1 $ gives the terminus. These maps satisfy the relation $ \delta_0(e) = \delta_1(\bar e) $.

Define a path in $ \Gamma $ as a finite sequence of edges $ p = e_1 \ldots e_n $ in which $ \delta_1(e_i) = \delta_0(e_{i + 1}) $ for $ i = 1 \ldots n - 1 $. If $ p_1 $ is an path then $ p_2 $ is a reduction of $ p_1 $ if it can be obtained by removing a pair of edges of the form $e \bar e$. Clearly, for every path $ p $ in $ \Gamma $, any maximal sequence of reductions terminates in the same minimal reduction. We say that two paths are equivalent if they have the same minimal reduction. This is an equivalence relation on the set of paths in $ \Gamma $. Denote the equivalence class of $ p $ by $ [p] $.

Define two functions $ o, t : P(\Gamma) \to V(\Gamma) $ (origin and terminus, resp.), where for $p = e_1 \ldots e_n $ we have $ o(p) = \delta_0(e_1) $ and $ t(p) = \delta_1(e_n) $.

Now construct the fundamental group of $ \mathcal{O} $ with respect to $ v_0 \in V(\Gamma) $, denoted $\pi_1(\Gamma/H, v_0)$. For each $ h \in H $, let $ B_h $ be the set of equivalence classes of paths $ p $ with $ o(p) = v_0 $ and $ t(p) = h . v_0 $. Then $ \pi_1(\mathcal{O}, v_0) = \lbrace ([p], h) \vert h \in H, [p] \in B_h \rbrace $. Denote an element of $ \pi_1(\mathcal{O}, v_0) $ by $ [p]_h $ where $ h \in H $ and $ p $ is a path in $ \Gamma $ such that $ o(p) = v_0 $ and $ t(p) = h . v_0 $. Define multiplication in $ \pi_1(\mathcal{O}, v_0) $ by

$$
    [p_0]_{h_1} \cdot [p_1]_{h_2} = [p_0 \cdot (h_1 . p_1)]_{h_1 h_2}.
$$

**Claim:** Multiplication in $ \pi_1(\mathcal{O}, v_0) $ is well-defined.

**Proof:** We must show that $ \pi_1(\mathcal{O}, v_0) $ is closed for the operation given above and that this operation is independent of the choice of representatives $p_0$ and $p_1$. For closure, it must be that $ t(p_0 \cdot (h_1 . p_1)) = h_1 h_2 . v_0 $. Note first that the concatenation $ p_0 \cdot (h_1 . p_1) $ is valid because $ t(p_0) = h_1 . v_0 $ and $ o(h_1 . p_1) = h_1 . o(p_1) = h_1 . v_0 $. Furthermore we have:
$$
    t(p_0 \cdot (h_1 . p_1)) = t(h_1 . p_1) = h_1 . t(p_1) = h_1 . h_2 . v_0 = h_1 h_2 . v_0.
$$
One can see that this is independent of choice representatives easily.

**Claim:** Multiplication in $ \pi_1(\mathcal{O}, v_0) $ is associative.

**Proof:** Let $[p_1]_{h_1}, [p_2]_{h_2}, [p_3]_{h_3} \in \pi_1(\mathcal{O}, v_0)$. Then we have
$$
    \begin{align*}
    ([p_1]_{h_1} \cdot [p_2]_{h_2}) \cdot [p_3]_{h_3} &= [p_1 \cdot h_1 . p_2]_{h_1 h_2} \cdot [p_3]_{h_3} \cr
    &= [p_1 \cdot h_1 . p_2 \cdot h_1 h_2 p_3]_{h_1 h_2 h_3}.
    \end{align*}
$$
Alternatively we have
$$
    \begin{align*}
    [p_1]_{h_1} \cdot ([p_2]_{h_2} \cdot [p_3]_{h_3}) &= [p_1]_{h_1} \cdot [p_2 \cdot h_2 . p_3]_{h_2 h_3} \cr
    &= [p_1 \cdot h_1 . (p_2 \cdot h_2 . p_3)]_{h_1 h_2 h_3} \cr
    &= [p_1 \cdot h_1 . p_2 \cdot h_1 h_2 . p_3]_{h_1 h_2 h_3}
    \end{align*}
$$
where the last line is because the action of $H$ distributes over path concatenation.

Let $ \emptyset $ denote the empty path in $ \Gamma $. Then clearly $ [\emptyset]_1 $ is the identity for the multiplication operation defined above.

For any path $ p = e_1 \ldots e_n $ in $ \Gamma $ define the reversed path $ \bar p = \bar e_n \ldots \bar e_1 $.

**Claim:** If $[p]_h \in \pi_1(\mathcal{O}, v_0)$ then $([p]_h)^{-1} = [h^{-1} . \bar p]_{h^{-1}} \in \pi_1(\mathcal{O}, v_0)$.

**Proof:** First we must show that $[h^{-1} . \bar p]_{h^{-1}} \in \pi_1(\mathcal{O}, v_0)$. We have
$$
    o(h^{-1} . \bar p) = h^{-1} . o(\bar p) = h^{-1} . t(p) = h^{-1} . h . v_0 = v_0,
$$
and
$$
    t(h^{-1} . \bar p) = h^{-1} . t(\bar p) = h^{-1} . o(p) = h^{-1} . v_0.
$$
Now, observe
$$
    [p]_h \cdot [h^{-1} . \bar p]_{h^{-1}} = [p \cdot ] = [p \cdot h . h^{-1} . \bar p]_{h h^{-1}} = [\emptyset]_1.
$$

Therefore $\pi_1(\Gamma/H, v_0)$ is a well defined group.

Note that the standard graph fundamental group of $ \Gamma $, $\pi_1(\Gamma, v_0) $ is included as a subgroup of $\pi_1(\mathcal{O}, v_0)$ by the monomorphism $[p] \mapsto [p]_1 $. 

Define the universal cover of the orbigraph $\mathcal{O}$ as a graph $T$ with $V(T)$ equal to the set of equivalence classes of paths in $\Gamma$ with origin $v_0 \in \Gamma$. Two vertices of $T$ are connected by an undirected edge if and only if the path class of one is a one edge extension of the path class of the other. (I.e. If $v_0 = [ab]$ and $v_1 = [abc]$ then they would be connected by an edge.) It is clear that $T$ is an infinite k-tree and its structure is independent of $v_0$.

Define the action of $\pi_1(\mathcal{O}, v_0)$ on $T$ by 
$$
    [p_0]_h . [p_1] = [p_0 \cdot h . p_1].
$$

**Claim:** The action of a given $[p]_h \in \pi_1(\mathcal{O}, v_0)$ is a automorphism of $T$.

**Proof:** Suppose that $[p_1], [p_2] \in V(T)$ with $[p_1] \text{~} [p_2]$. Thus we may assume without loss of generality that $p_1 = e_1 \ldots e_n$ and $p_2 = e_1 \ldots e_n e_{n+1}$. Then we have
$$
    [p]_h . [p_1] = [p \cdot (h . e_1) \cdots (h . e_n)]
$$
and 
$$
    [p]_h . [p_2] = [p \cdot (h . e_1) \cdots (h . e_{n+1})].
$$
Clearly $[p]_h . [p_2]$ is a one-edge extension of $[p]_h . [p_1]$ and they are therefore connected by an edge.

Alternatively, assume that $[p]_h . [p_1] \text{~} [p]_h . [p_2]$ then we can assume that $[p]_h . [p_1] = p \cdot e_1 \ldots e_n$ and $[p]_h . [p_2] = \cdot e_1 \ldots e_{n+1}$. Hence $[p_1] \text{~} [p_2]$.

Finally, we can prove the main theorem regarding the fundamental group:

**Claim:** $T/\pi_1(\mathcal{O}, v_0) \equiv \mathcal{O}$.

**Proof:** First, note that for $[p] \in V(T)$, $\phi([p]) = t(p)$ is a Graph homomorphism from $T$ to $\Gamma$. (This is well defined because if two paths are equivalent then they must have the same terminus.) To show that $T/\pi_1(\mathcal{O}, v_0) \equiv \mathcal{O}$ we will show that vertices of $T$ are in the same orbit by $\pi_1(\mathcal{O}, v_0)$ if and only if their images under $\phi$ are in the same orbit by $H$. This is sufficient because we know that $ \mathcal{O} = \Gamma / H$.

First, assume that for some $[p]_h \in \pi_1(\mathcal{O}, v_0)$, and vertices $[p_0], [p_1] \in T$ we have $[p]_h \cdot [p_0] = [p_1]$. Then I claim that $\phi([p_0]) = h . \phi([p_1])$, and so the images are in the same orbit under $H$. Observe:
$$
    \phi([p_1]) = \phi([p]_h \cdot [p_0]) = \phi([p \cdot (h . p_0)]) = t(p \cdot (h . p_0)) = t(h . p_0) = h . t(p_0) = h.\phi([p_0]).
$$

On the other hand, assume that for $v_a, v_b \in \Gamma$ and $h \in H$ we have $h . v_a = v_b$. Then I claim that if $\phi([p_a]) = v_a$ and $\phi([p_b]) = v_b$ for some $[p_a], [p_b] \in T$, then there exists a $g \in \pi_1(\mathcal{O}, v_0)$ such that $g . [p_a] = [p_b]$. In fact, $g = [p_b \cdot (h . \bar {p_a})]_h$. Note that this is a valid element of $\pi(\mathcal{O}, v_0)$ beacuse $o(h . \bar{p_a}) = h . t(p_a) = h . \phi([p_a]) = h . v_a = v_b = \phi([p_b]) = t(p_b)$. Furthermore, $p_b$ begins at $v_0$ and
$$
    t(p_b \cdot (h . \bar {p_a})) = t(h . \bar{p_b}) = h . t(\bar{p_b}) = h . o(p_b) = h . v_0.
$$
We have
$$
    [p_b \cdot (h . \bar {p_a})]_h . [p_a] = [p_b \cdot (h . \bar{p_a}) \cdot h . p_a] = [p_b].
$$
Thus $\pi_1(\mathcal{O}, v_0)$ is a reasonable fundamental group of $\mathcal{O}$.


