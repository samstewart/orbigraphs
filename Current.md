Current Work
============

Mathematica Notebooks
---------------------

Here are some mathematica notebooks giving conjectures and evidence. **You will need to put [[orbigraphs package | /Mathematica/Orbigraphs.m]] in the same directory as the notebooks.**

- [[Cospectral bad orbigraphs | /Mathematica/CospectralBad.nb]]
- [[Cycle spectra | /Mathematica/CycleSpectrum.nb]]
- [[Non diagonalizable adjacency matrices | /Mathematica/NonDiagonalizable.nb]]
- [[Sunada's theorem | /Mathematica/SunadaOrbigraphs.nb]]
- [[Counting conjugating elements | /Mathematica/ConjugatorCounting.nb]]
- [[Spectral radius | /Mathematica/PerronFrobenius.nb]]

Meeting Notes
-------------

- Week 1
    - [[May 20 | May20]]
    - [[May 21 | May21]]
    - [[May 22 | May22]]
    - [[May 23 | May23]]
    - [[May 24 | May24]]
- Week 2
    - [[May 28 | May28]]
    - [[May 29 | May29]]
    - [[May 30 | May30]]

Questions
---------

- Do all orbigraphs come from quotients of k-trees by automorphism groups?
    - We know that good ones do, via the [[fundamental group | GoodFundamentalGroup]], but is is unclear if all bad ones do.
- If the Markov process associated to an orbigraph is reversible, we believe that the orbigraph has a finite k-regular cover with an equitable partition that produces the orbigraph, but is there a group acting on this finite cover that produces the orbigraph.
- We know that if the associated Markov process is irreversible, then the orbigraph is bad. What geometrical properties of the graph are sufficient for this? Same question in the other direction.
    - This is answered by Kolmogorov's criterion for reversibility. In particular, an orbigraph is good if and only if the number of ways to traverse any closed loop is independent of the direction of traversal.
- We have a version of Sunada's theorem that works for good orbigraphs. The extension to bad orbigraphs seems hard to test or prove, and possibly not useful. Are there other ways to tell if two orbigraphs are cospectral?
- The finite version of Sunada's theorem is somewhat weak because it can be difficult to find a common finite covering of two orbigraphs and the groups acting on that cover which produce the orbigraphs in question.
    - Task: read Leighton and figure out how he constructs the common finite cover.
- Can we obtain information about the singular points of an orbigraph from its spectrum? Possibilities include:
    - The number of singular points.
        - Yes, there are bounds on the number of singular points which are exact in some cases.
    - The number of types of singular points.
- Is there anything interesting to be said about quotients of orbigraphs by group actions?
    - Do all orbigraphs have an orbigraph cover?
- For good orbigraphs, how can we related the group action that they originate by to the isotropy groups of the vertices?
