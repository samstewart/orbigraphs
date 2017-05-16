Spectral Radius of Matrix Decomposed into Square Matrices on the Diagonal
=========================================================================

**Claim**: If $A$ is a square matrix consisting of square block matrices $B_1, \ldots, B_m$ on the diagonal and zeros elsewhere, then $\sigma(A) = \lbrace \sigma(B_1) \cup \sigma(B_2) \cup \ldots \cup \sigma(B_m) \rbrace $.

**Proof**: 
Meyer p. 475 shows that if $E$ and $G$ are square matrices then:

$$
det \left[
	\begin{array}{c c}
	E & F \cr
	0 & G \cr
	\end{array} 
\right]
= det(E) \times det(G)
$$

In our case, we have multiple square block matrices $B_1, \ldots, B_m$ and zeros elsewhere. Let $A = B_1 \oplus \ldots \oplus B_m$ where $\oplus$ is the direct sum operator on matrices. The direct sum is associative so that $A = B_1 \oplus M$ where $M = B_2 \oplus \ldots \oplus B_m$. We also know that $M$ is square because the direct sum of square matrices is always square. Thus, we can recursively apply Meyer's fact so that $det(A) = det(B_1) det(B_2) \cdots det(B_m)$.

The characteristic equation $det(A - \lambda I) = 0$ gives us the eigenvalues for $A$. Since $B_1, \ldots, B_m$ are on the diagonal, then $A - \lambda I) = B_1 - \lambda I, \ldots, B_m - \lambda I$ (the dimension of $I$ changes accordingly). Then we we know that $ \\det(A - \lambda I) = det(B_1 - \lambda I) det(B_2 - \lambda I) \cdots = det(B_m - \lambda I) = 0$. If any $det(B_i - \lambda I) = 0 $ then the entire product is zero. Thus, $\sigma(A) = \sigma(B_1) \cup \ldots \sigma(B_m)$.

In our case, we have multiple square block matrices $B_1, \ldots, B_m$ and zeros elsewhere. Note that any of these matrices can be combined into a larger block matrix that is also square since every $B_i$ contributes $n$ rows and $n$ columns. Since the block matrices are on the diagonal, the added rows do not overlap.

