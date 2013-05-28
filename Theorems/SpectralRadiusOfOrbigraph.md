Spectral Radius of an Orbigraph
===============================

**Claim**: Let $O$ be a k-[[Orbigraph]] and let $\rho(O)$ be the [[SpectralRadius]] of $O$. Then $\rho(O) = k$.

**Proof**: 
Please see [[GraphConnectedness]] for definitions of connected, strongly connected, and weakly connected. We know that $O$ is either connected or disconnected. In the case that $O$ is connected, we know that $O$ is also strongly connected by [[OrbigraphConnectedThenStronglyConnected]]. Thus, the adjacency matrix $A$ of $O$ is irreducible by [[IrreducibleIfStronglyConnected]]. Hence, since we know all entries of $A$ are non-negative by the definition of an adjacency matrix, we know that $\rho(A) = k$ by [[SpectralRadiusOfConstantRowSums]].

In the case that $O$ is disconnected, we know that the disconnected subgraphs $o_i$ are also k-orbigraphs by [[DisconnectedOrbigraphSubOrbigraphs]]. For each $o_i$ we know that $\rho(R_i) = k$ by the same reasoning as above where $R_i$ is the adjacency matrix for $o_i$. Using the same construction as in [[DisconnectedOrbigraphSubOrbigraphs]], we can decompose $A$ into a matrix with the square adjacency matrices $R_1, \ldots, R_m$ on the diagonal. By [[SpectralRadiusOfBlockMatrices]], we know that $\sigma(A) = \sigma(R_1) \cup \ldots \cup \sigma(R_m)$ from this decomposition. Since $\rho(R_i) = k \geq \left| \lambda \right| \in \sigma(R_i)$, then we know that $\rho(A) = k$ because there are no eigenvalues in $\sigma(R_1) \cup \ldots \cup \sigma(R_m)$ that exceed $k$ in magnitude.


