Counting Conjugating Elements
=============================

**Claim:** If \\( G \\) is a finite group with element \\( g \\) and subgroup \\( H \\), then the subset \\( A_g = \\{  l : lgl^{-1} \in H \\} \subset G \\) has exactly \\( \\#(C(g)) \cdot \\#([g] \cap H) \\) elements.

**Proof:** First, I will show that for any element \\( g \in G \\) we have a bijection \\( F : [g] \to \\{a C(g) : a \in G \\} \\). Let \\( X \\) be a left coset of \\( C(g) \\), then for some representative \\( a \in X \\), let \\( F(X) = a g a^{-1} \\). First, I must show that \\( F \\) is well-defined. To do this, suppose that \\( x, y \in X \\), then there is a \\( c \in C(g) \\) such that \\( y = x c \\). Hence we have
$$
\begin{align*}
y g y^{-1} &= (x c) g (x c)^{-1} \\\\
&= x c g c^{-1} x^{-1} \\\\
&= x g x^{-1}.
\end{align*}
$$
Therefore for any choice of representative, \\( F(X) \\) gives the same value.

Next, suppose that \\( a g a^{-1} \in [g] \\) for some \\( a \\). Then because the cosets of \\( C(g) \\) partition \\( G \\) there is a coset \\( Y \\) that contains \\( a \\). Then we have \\( F(Y) = a g a^{-1} \\). Hence \\( F \\) is surjective.

Finally, suppose that  \\( x g x^{-1} = y g y^{-1} \\). Then we have:
$$
\begin{align*}
& x g x^{-1} = y g y^{-1}
&\implies y^{-1} x g x^{-1} = g y^{-1}
&\implies (y^{-1} x) g = g (y^{-1} x).
\end{align*}
$$
Therefore \\( y^{-1} x \in C(g) \\) which implies that \\( x C(g) = y C(g) \\) and \\( F \\) must be injective.

Using this, I will prove the main theorem. Clearly, we can write \\( \\#(A_g) = \sum_{h \in [g] \cap H} \\#(l : l g l^{-1} = h) \\). To determine the number of elements in each summand, let \\( h \in [g] \cap H \\). Then let \\( X = f^{-1}(h) \\). By the definition of \\( F \\), for all \\( a \in X \\) we have \\( h = a g a^{-1} \\). Furthermore, suppose that \\( b g b^{-1} = h \\), then by the proof of the injectivity of \\( F \\), it must be that \\( b \in X \\). Therefore \\( \\#(l : l g l^{-1} = h) = \\#(X) = \\#(C(g)) \\). Hence we have 
$$
\begin{align*}
\\#(A_g) &= \sum_{h \in [g] \cap H} \\#(C(g)) \\\\
&= \\#(C(g)) \cdot \\#([g] \cap H).
\end{align*}
$$
