
///
   Consequences
    Item
   Description
    Text
      Code
      Pre
    Example
      CannedExample
   Subnodes
   Caveat
   SeeAlso
///

doc ///
  Key 
      "Canonical Series Tutorial"
  Headline
      Computing series solutions to regular holonomic systems
  Description
    Text
      If D/I is a regular holonomic D-module, the solutions of the system of differential equations
      I can be written as Nilsson series (Puiseux series with logarithms). 
      The constructive version of this result is the canonical series method
      [@HREF("https://mathscinet.ams.org/mathscinet/pdf/1734566.pdf","SST, Sections 2.5, 2.6")@].
      In this tutorial, we illustrate an implementation of this method.
      
    Text
      If the input ideal I is not regular, this method is not guaranteed to produce convergent
      series, or even holonomicRank(I) formal power series solutions of I. There currently exists
      no computational method to verify whether D/I is a regular holonomic D-module. 
      In the case of GKZ systems, regularity has been characterized in terms of the input matrix.
    
    Text 
      Contains the following functions: 
      
      
    Text 
      Currently, this contains the computation of exponents with respect to a weight vector. Completing the canonical series computation is in the future.
      To compute the exponents for a D-ideal I with respect to w, do as follows. 
      Compute the initial ideal of I with respect to w. 
      Introduce the subring of D consisting of polynomials in 
      $\theta_1 = x_1 \partial_1, ... , \theta_n= x_n \partial_n$. This is a commutative polynomial subring of D, 
      referred to here as thetaRing.
      The indicial ideal of I with respect to w is produced by extending the initial ideal to the ring of 
      differential operators with rational function coefficients, and contract to thetaRing. The exponents of I
      with respect to w are the roots of the indicial ideal, counted with multiplicities. 
     
--   Example
--      2+2


--      R = QQ[x]
--      W = makeWA R
--      I = ideal(x*(1-x)*dx^2-(1-x)*dx+1)
--      inw(I,{-1,1})  

    Example
     needsPackage "Dmodules"
     R1 = QQ[z]
     W1 = makeWA R1
     a=1/2
     b=3
     c=5/3
     J = ideal(z*(1-z)*dz^2+(c-(a+b+1)*z)*dz-a*b) -- the Gauss hypergeometric equation, exponents 0, 1-c 
     cssExpts(J,{1})
     inw(J,{-1,1})
     thetaIdeal(oo,QQ[s])
     factor oo_0
     c=1  -- Now we have a single exponent of multiplicity 2
     J = ideal(z*(1-z)*dz^2+(c-(a+b+1)*z)*dz-a*b)
     cssExpts(J,{1})
     cssExptsMult(J,{1})
    
     
      
    Text  
      The first step is to rewrite elements of the initial ideal in a terms of the thetaRing, in a way that will allow us to easily
      extend and contract see [SST] 
      

    
    
    Example
      R2 = QQ[x_1..x_3]
      W2 = makeWA R2
      gens W2
      thetaRing = QQ[t_1,t_2,t_3] -- sets variable names t_i = x_i\dx_i
      f1= x_1*dx_1 -- this element already belongs to thetaRing
      genToDistractionGens(f1,thetaRing)  -- checks out
      f2 = x_1^3*dx_1^3 -- this is a descending factorial in the theta variables
      genToDistractionGens(f2,thetaRing)
      factor oo	  -- now it looks like a descending factorial
      f = x_1^2*x_2^2*x_3*dx_1*dx_2^2*dx_3^2
      genToDistractionGens(f,thetaRing)
      
    Text
      Here is an example that can be continued when more functions are implemented.
      This is worked out as [page 138, ex 3.5.3, SST]. 
      
    Example
      A = matrix{{1,1,1},{0,1,2}}
      --I = gkz(A,{10,8},R2)
      I = gkz(A,{10,8})
      holonomicRank(I)
      cssExpts(I,{1,0,0})
    
    Text
      In this case, the series corresponding to the exponent 
      (2,8,0) is logarithm-free (actually, this is a hypergeometric polynomial),
      while the series corresponding to (0,12,-2) has logarithms. 
      [SST, page 138] has the polynomial, and four terms of the logarithmic series.
      
    
///


doc ///
   Key
     genToDistractionGens
     (genToDistractionGens, RingElement, Ring)
   Headline
     the image in the thetaRing of a torus-fixed element in a Weyl algebra
   Usage
     genToDistractionGen(f,thetaRing)
   Inputs
     f:RingElement 
       in a Weyl algebra D of the form x^u Dx^v
     thetaRing:Ring 
       that is a stand in for the theta ring inside D
   Outputs
     :List  
       in thetaRing that is the result of applying [@HREF("https://mathscinet.ams.org/mathscinet/pdf/1734566.pdf","SST")@, Lemma 2.3.1] to f.
   Description
    Text
      Code
      Pre
    Example
      R = QQ[x_1..x_4]
      W = makeWA R
      describe W
      2+2
///

doc ///
   Key
     thetaIdeal
     (thetaIdeal, Ideal, Ring)
   Headline
     the image in the thetaRing of a torus-fixed ideal in a Weyl algebra
   Usage
     thetaIdeal(I,thetaRing)
   Inputs
     I:
       Ideal in a WeylAlgebra that is torus-fixed
   Outputs 
     :Ideal 
       that results from intersecting I with the thetaRing of D, as in 
       [@HREF("https://mathscinet.ams.org/mathscinet/pdf/1734566.pdf","SST")@, Lemma 2.3.1] to I.
   Description
    Text
      Code
      Pre
    Example
      2+2
///

doc ///
   Key
     cssExpts
     (cssExpts, Ideal, List)
   Headline
     the exponents of the canonical series solutions of I in the direction of a weight vector
   Usage
     cssExpts(I,w)
   Inputs
     I:
       holonomic ideal in a Weyl algebra D
     w:
       List of (generic) weights for I, of length half the number of variables in D
   Outputs
     :List 
       of exponents of the exponents of the canonical series solutions of I 
       in the direction of (-w,w), as in 
       [@HREF("https://mathscinet.ams.org/mathscinet/pdf/1734566.pdf","SST")@, Theorem 2.3.11].
   Description
    Text
      Code
      Pre
    Example
      2+2
///

doc ///
   Key
     cssExptsMult
     (cssExptsMult, Ideal, List)
   Headline
     the exponents (and multiplicities) of the canonical series solutions of I in the direction of a weight vector
   Usage
     cssExptsMult(I,w)
   Inputs
     I:
       holonomic ideal in a Weyl algebra D
     w:
       List of (generic) weights for I, of length half the number of variables in D
   Outputs
     :List 
       of exponents of the starting exponents of the canonical series solutions of I 
       in the direction of (-w,w), as in 
       [@HREF("https://mathscinet.ams.org/mathscinet/pdf/1734566.pdf","SST")@, Theorem 2.3.11], 
       together with their multiplicities. 
   Description
    Text
      Code
      Pre
    Example
      2+2
///

doc ///
   Key
     isTorusFixed
     (isTorusFixed, Ideal)
   Headline
     checks if an ideal in a Weyl algebra is torus-fixed
   Usage
     isTorusFixed I
   Inputs
     I:Ideal
       in a WeylAlgebra
   Outputs
     :Boolean 
       true if I is torus-fixed, false if not
   Description
    Text
       [@HREF("https://mathscinet.ams.org/mathscinet/pdf/1734566.pdf","SST")@], 
       just before Lemma 2.3.1.
///

