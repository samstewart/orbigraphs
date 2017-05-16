Disconnected Orbigraph has Consists of Smaller Orbigraphs
=========================================================

**Claim**:
Let $O$ be a k-orbigraph. If $O$ is disconnected, then the disconnected subgraphs of $O$ are also k-orbigraphs.

**Proof**:
Let $A$ be the adjacency matrix of $O$ and assume that $O$ is disconnected. Call each disconnected subgraph $o_i$. Bundle the vertices of $O$ into disjoint sets $S_i$ where membership is determined by the vertex's membership in $o_i$. Bundle the entries in $A$, representing edges, into block matrices $R_i$ according to each edge's membership in $S_i$. Re-arrange $A$ so that it looks like the following:


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

Each row in $A$ contains only zeros besides the block matrix because $S_i$ has no vertices that connect to any other vertices in $S_j$. Nevertheless, each row in $R_i$ must still sum to $k$ because each row in $A$ must sum to k. Thus, each $R_i$ and corresponding $S_i$, together representing a $o_i$, corresponds to a k-orbigraph.