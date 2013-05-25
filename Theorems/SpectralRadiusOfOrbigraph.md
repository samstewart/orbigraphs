# Spectral Radius of an Orbigraph

**Claim**: Let \\(O\\) be a k-[[Orbigraph]] and let \\(\rho(O)\\) be the [[SpectralRadius]] of \\(O\\). Then \\(\rho(O) = k\\).

**Proof**: 
We begin with several definitions followed by a few useful lemmas.

### Connected
[[GraphConnectedness]]

### Strongly Connected
[[GraphConnectedness]]

### Weakly Connected
[[GraphConnectedness]]

### Lemma 1.0

**Claim**:
Let \\(O\\) be a k-oribigraph. If \\(O\\) is weakly connected then it is strongly connected.

**Proof**:
Let \\(A\\) be the adjacency matrix of \\(O\\) and assume that \\(O\\) is weakly connected. We wish to show that \\(O\\) is also strongly connected. We know that for every non-zero entry \\(a_{i,j} \in A\\) the corresponding entry \\(a_{j,i} \in A\\) is also non-zero, by definition. This symmetry means that if there is an edge from vertex \\(i\\) to vertex \\(j\\) then there is an edge from vertex \\(j\\) to vertex \\(i\\). Also by definition, if \\(O\\) is weakly connected, than for any two verticies \\(i, j\\) there exists an edge, WLOG \\((i, j)\\) between them. By the symmetry of \\(A\\) we also know there is an edge \\((j, i)\\) in the opposite direction. Hence, \\(O\\) is strongly connected.

### Lemma 1.1:
**Claim**:
Let \\(O\\) be a k-orbigraph. If \\(O\\) is disconnected, then the disconnected subgraphs of \\(O\\) are also k-orbigraphs.

**Proof**:
Let \\(A\\) be the adjacency matrix of \\(O\\) and assume that \\(O\\) is disconnected. Call each disconnected subgraph \\(o_i\\). Bundle the vertices of \\(O\\) into disjoint sets \\(S_i\\) where membership is determined by the vertex's membership in \\(o_i\\). Bundle the entries in \\(A\\), representing edges, into block matrices \\(R_i\\) according to each edge's membership in \\(S_i\\). Re-arrange \\(A\\) so that it looks like the following:


$$
\begin{array}{c c} &
\begin{array}{c c c} S_1 & \ldots & S_m \cr
\end{array} 
\cr
\begin{array}{c c c}
S_1 \cr
\vdots \cr
S_m
\end{array} 
&
\left[
\begin{array}{c c c}
R_1 & 0 & \ldots \cr
0 & R_2 & \ldots \cr
0 & \ldots & R_m \cr
\end{array}
\right] 
\end{array}
$$

Each row in \\(A\\) contains only zeros besides the block matrix because \\(S_i\\) has no vertices that connect to any other vertices in \\(S_j\\). Nevertheless, each row in \\(R_i\\) must still sum to \\(k\\) because each row in \\(A\\) must sum to k. Thus, each \\(R_i\\) and corresponding \\(S_i\\), together representing a \\(o_i\\), corresponds to a k-orbigraph.

### Lemma 1.2:
**Claim**:
If \\(A \in \mathcal{C}^{n \times n} \geq 0\\) and the rows of \\(A\\) sum to \\(k\\) then \\(\rho(A) = k\\). 

**Proof**:
By the \\(\textit{Collatx-Wiedlandt}\\) formula (Meyer 673) we know that \\(\rho(A) = r = \max_{\textbf{x} \in \mathcal{N}} f(\textbf{x})\\) where

$$
f(\textbf{x}) = \min_{i \in \lbrace 1 \ldots n \rbrace } \frac{\left[ A\textbf{x} \right]_i}{x_i}
$$

and \\(\mathcal{N} = \lbrace \textbf{x} \geq \textbf{0}, \textbf{x} \neq \textbf{0} \rbrace \\). In other words, \\(\textbf{x}\\) must be non-negative and not entirely \\(\textbf{0}\\).

Pick \\(\textbf{x} = c\cdot \textbf{1}\\) for some constant \\(c\\) and let \\(\textbf{1}\\) be a vector of \\(1\\)s. Multiplying \\(A\\) by \\(\textbf{x}\\) gives us a set of dot products of the rows of \\(A\\). Let \\(A_i\\) represent the \\(i\\)th row of \\(A\\). Then \\(A \cdot \textbf{x} = \lbrace A_i \cdot \textbf{x} \; | \; i \in \lbrace 1 \ldots n \rbrace \rbrace \\). However, since the \\(\textit{Collatx-Wiedlandt}\\) formula normalizes each \\(A_i \cdot \textbf{x}\\) by \\(x_i\\) and all \\(x_i = c\\) then we have the following:

$$
\begin{align}
	\frac{\left[ A \cdot \textbf{x} \right]_i}{x_i} &= \frac{c \left[ A \cdot \textbf{1} \right]_i}{x_i} \cr
	&= \frac{c \left[ A \cdot \textbf{1} \right]_i}{c} \cr
	&= \left[ A \cdot \textbf{1} \right]_i \cr
	&= \sum_{j = 1}^{n} a_{i, j} \cr
	&= k
\end{align}
$$

Substituting back into the \\(\textit{Collatx-Wiedlandt}\\) formula gives us the following:

$$
\min_{i \in \lbrace 1 \ldots n \rbrace} \frac{\left[ A\textbf{x} \right]_i}{x_i} = \min_{i \in \lbrace 1 \ldots n \rbrace} k = k
$$

In other words, picking a constant vector \\(\textbf{x}\\) makes \\(\rho(A) = \max_{\textbf{x} \in \mathcal{N}} f(\textbf{x}) \geq f(c \cdot \textbf{1}) = k\\). To show that \\(\rho(A) = k\\), we must show that \\(\textbf{x} = c \cdot \textbf{1}\\) maximizes \\(f(\textbf{x})\\).

Pick \\(x_j\\) to be the largest entry in \\(\textbf{x}\\). We know that \\(x_j \neq 0\\) and that \\(x_j\\) is larger than at least one other entry because the entries of \\(\textbf{x}\\) are not identical. We know that

$$
\begin{align}
	\frac{\left[ A \cdot \textbf{x} \right]_j}{x_j} = a_{j, 1} x_1/x_j + a_{j, 2} x_2/x_j + \ldots + a_{j, n} x_n/x_j \cr 
	&\geq f(\textbf{x}) \cr
	&= \min_{i \in \lbrace 1 \ldots n \rbrace} \frac{\left[ A \cdot \textbf{x} \right]_i}{x_i}
\end{align}
$$

Furthermore, we know that
$$
a_{j, 1} x_1/x_j + a_{j, 2} x_2/x_j + \ldots a_k + \ldots + a_{j, n} x_n/x_j \leq k
$$

because every \\(x_m / x_j \leq 1\\). Thus, for any \\(\textbf{x}\\) with non-identical entries, \\(f(\textbf{x}) \leq k\\). Hence, \\(\textbf{x} = c \cdot \textbf{1}\\) maximizes \\(f(\textbf{x})\\) showing that \\(\rho(A) = f(c \cdot \textbf{1}) = k\\).

### Lemma 1.3
**Claim**: If \\(A\\) is a square matrix consisting of square block matrices \\(B_1, \ldots, B_m\\) on the diagonal and zeros elsewhere, then \\(\sigma(A) = \lbrace \sigma(B_1) \cup \sigma(B_2) \cup \ldots \cup \sigma(B_m) \rbrace \\).

**Proof**: 
Meyer p. 475 shows that if \\(E\\) and \\(G\\) are square matrices then:

$$
det \left[
	\begin{array}{c c}
	E & F \cr
	0 & G \cr
	\end{array} 
\right]
= det(E) \times det(G)
$$

In our case, we have multiple square block matrices \\(B_1, \ldots, B_m\\) and zeros elsewhere. Let \\(A = B_1 \oplus \ldots \oplus B_m\\) where \\(\oplus\\) is the direct sum operator on matrices. The direct sum is associative so that \\(A = B_1 \oplus M\\) where \\(M = B_2 \oplus \ldots \oplus B_m\\). We also know that \\(M\\) is square because the direct sum of square matrices is always square. Thus, we can recursively apply Meyer's fact so that \\(det(A) = det(B_1) det(B_2) \cdots det(B_m)\\).

The characteristic equation \\(det(A - \lambda I) = 0\\) gives us the eigenvalues for \\(A\\). Since \\(B_1, \ldots, B_m\\) are on the diagonal, then \\(A - \lambda I) = B_1 - \lambda I, \ldots, B_m - \lambda I\\) (the dimension of \\(I\\) changes accordingly). Then we we know that \\det(A - \lambda I) = det(B_1 - \lambda I) det(B_2 - \lambda I) \cdots = det(B_m - \lambda I) = 0\\). If any \\(det(B_i - \lambda I) = 0\\) then the entire product is zero. Thus, \\(\sigma(A) = \sigma(B_1) \cup \ldots \sigma(B_m)\\).

In our case, we have multiple square block matrices \\(B_1, \ldots, B_m\\) and zeros elsewhere. Note that any of these matrices can be combined into a larger block matrix that is also square since every \\(B_i\\) contributes \\(n\\) rows and \\(n\\) columns. Since the block matrices are on the diagonal, the added rows do not overlap.

