Counting Conjugating Elements
=============================

**Claim:** If \\( G \\) is a finite group with element \\( g \\) and subgroup \\( H \\). The subset \\( A_g = \\{  l : lgl^{-1} \in H \\} \subset G \\) has exactly \\( \\#(C(g)) \cdot \\#([g] \cap H) \\) elements.

**Proof:** To prove this fact, we will establish a bijection between \\( A_g \\) and \\( B_g = C(g) \times ([g] \cap H) \\). Let \\( (c, h) \in B_g \\). Then there exists an \\( a \in G \\) such that \\( a g a^{-1} = h \in H \\). Then I claim that \\( \phi(c, h) = a c\\) is a injection from \\( B_g \\) to \\( A_g \\). To show that the co-domain of \\( \phi \\) is \\( A_g \\) we have: 

$$
\begin{align*}
    (ac)g(ac)^{-1} &= acgc^{-1}a^{-1} \\\\
    &= agcc^{-1}a^{-1} \\\\
    &= aga^{-1} \in H.
\end{align*}
$$

Now I will show that \\( \phi \\) is an injection. Assume that \\( (c, a), (c', a') \in B_g \\) and \\( a c = a' c' \\). Note that \\( C(g) \\) is a subgroup of \\( G \\) so we have \\( a c \in a C(g) \\) and \\( a' c' \in a' C(g) \\). However, unequal cosets are disjoint, so we must have \\( a = a' \\). Therefore by cancellation, we also have \\( c = c' \\). Thus \\( \phi \\) is an injection and \\( \\#(B_g) \le \\#(A_g) \\).


It remains to be shown that \\( \phi \\) is a surjection.
