Presentation for Research Group
===============================

Our results:

**Spectral Radius is $K$**

**Sundada for Orbigraphs (for free from representation theory proof)**

**Fundamental Group for Good Orbigraphs**

**Definitions of Good and Bad Orbigraphs**

## Markov Chain Reversibility Characterization

**Bounds on singular points from the spectrum: ** $ \frac{\sum_{i} \lambda_i^2 - n k}{k^2 - k} \le s \le \sum_{i} \lambda_i^2 - n k $

**Better bounds for symmetric matrices**

**What is a Markov chain?**

A Markov chain is a collection of random variables $X_1, X_2, \ldots, X_n$ where the random variables take on values from the state space $\Omega$. Furthermore, the distribution of the $(X_n)$ satisfies the "Markov property" so that $Pr(X_{n+1} = i | X_{n} = j) = Pr(X_{n+1} = i | X_{n} = j, X_{n-1} = k, \ldots, X_1 = l)$.

**How does a Markov chain take a step?***

**What is a stationary distribution?***
A stationary distribution $\pi$ satisfies the following two properties:
1. $\sum_{i} \pi_i$ = 1
2. $\pi P = \pi$

**What does it mean to limit to a stationary distribution?***
A Markov chain must be both aperiodic and irreducible to possess a stationary distribution and limit to this distribution regardless of the initial distribution. Naturally, these chains, known as __ergodic__ chains, are of great interests to statisticians because ergodic chains enable us to study the __long term__ behavior or systems with the Markov property. The stationary distribution captures the proportion of time we spend in each state of the system after many, many, many steps and also exhibits a strange property: a further step does not change the stationary distribution. In other words, the probability of being in any particular state does not change after taking any number of steps.

**How does our work relate to markov chain lumpability**
The lumping process creates a partition $Q = Q_1 \cup Q_2 \cup Q_3 \cup \ldots \cup Q_n$ such that $\sum_{i} Pr(X_{n + 1} = Q_i | X_{n} = Q_j)$ is well-defined (independent of what representative we choose from $Q_i$).

**What is the detailed balance equation?**

**How does the detailed balance equation relate to the structure of the graph?**

## Hard Questions
**Reversibility imply orbit cover?**

**Fundamental group for bad orbigraphs?**

**Are we out of questions?**