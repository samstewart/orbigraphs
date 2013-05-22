# Spectral Radius of an Orbigraph

**Claim**: Let \\(O\\) be a k-[[Orbigraph]] and let \\(\rho(O)\\) be the [[spectral radius]] of \\(O\\). Then \\(\rho(O)\\) = k\\).

**Proof**: 
We begin with a definitions followed by a few useful lemmas.

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
Let \\(A\\) be the adjacency matrix of \\(O\\) and assume that \\(O\\) is disconnected. Call each disconnected subgraph \\(o_i\\). Arrange the rows of \\(A\\) so that 

### Lemma 1.2:
**Claim**:
If \\(\textbf{A} \in \mathcal{C}^{n \times n} \geq 0\\) and the rows of \\(A\\) sum to \\(k\\) then \\(\rho(A) = k\\). 

**Proof**:
By the Collatx-Wiedlandt formula (Meyer 673) we know that \\(\rho(A) = r = \max_{\textbf{x} \in \mathcal{N}} f(\textbf{x})\\) where

$$
f(\mathbb{X}) = \min_{i \in \{1 \ldots n\}} \frac{\textbf{A}}{\textbf{x}_i}
$$



