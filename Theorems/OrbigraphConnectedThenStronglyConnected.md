Orbigraph is Connected then Strongly Connected
==============================================
**Claim**:
Let $O$ be a k-oribigraph. If $O$ is weakly connected then it is strongly connected.

**Proof**:
Let $A$ be the adjacency matrix of $O$ and assume that $O$ is weakly connected. We wish to show that $O$ is also strongly connected. We know that for every non-zero entry $a_{i,j} \in A$ the corresponding entry $a_{j,i} \in A$ is also non-zero, by definition. This symmetry means that if there is an edge from vertex $i$ to vertex $j$ then there is an edge from vertex $j$ to vertex $i$. Also by definition, if $O$ is weakly connected, than for any two verticies $i, j$ there exists an edge, WLOG $(i, j)$ between them. By the symmetry of $A$ we also know there is an edge $(j, i)$ in the opposite direction. Hence, $O$ is strongly connected.