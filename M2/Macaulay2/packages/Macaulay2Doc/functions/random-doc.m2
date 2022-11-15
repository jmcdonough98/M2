undocumented {
    (random, GaloisField),
    (random, QuotientRing),
    (random, RingFamily),
    }

doc ///
Node
  Key
    random
  Headline
    get a random object
  Description
    Text
      This function can be used to get randomized objects of various sorts.
  Subnodes
    (random, ZZ, ZZ)
    (random, Type)
    (random, List)
    (random, ZZ, Ideal)
    (random, ZZ, Ring)
    (random, Module, Module)
  SeeAlso
    setRandomSeed

Node
  Key
    (random, ZZ, ZZ)
    (random, ZZ)
    (random, RR, RR)
    (random, RR)
  Headline
    get a random integer or real number
  Synopsis
    Usage
      random(low, high)
      random high
    Inputs
      low:{ZZ,RR}
      high:{ZZ,RR}
    Outputs
      :ZZ
        a random integer or real number of the same @TO precision@
  Description
    Text
      If only @TT "high"@ is given, the output will be in the range @TT "[0, high)"@.
    Example
      random 57
      random 10^50
      tally apply(100, i -> random 7)
      random 3.14
      random 3p200
    Text
      If, in addition, @TT "low"@ is given, the output will be in the range @TT "[low, high]"@
    Example
      for i to 10 list random(100,200)
      tally apply(100, i -> random(10,15))
      random(10.,20.)
      random(10p100,20p100)
  SeeAlso
    setRandomSeed

Node
  Key
    (random, Type)
  Headline
    get a random object of a type
  Usage
    random T
  Inputs
    T:Type
    Height => ZZ
  Outputs
    :Thing
      a random instance of the type @TT "T"@
  Description
    Text
      If the @TT "Height"@ option specifies a number @TT "h"@ and @TT "T"@
      is @TO "ZZ"@ then the integers returned are in the range @TT "[0, h)"@;
      for @TO "QQ"@ the numerator and denominator are in the range @TT "[1, h]"@.
    Example
      random RR
      random CC_100
      tally for i to 100 list random GF 11
      random GF(2,40)
  SeeAlso
    setRandomSeed

Node
  Key
    (random, ZZ,   Ring)
    (random, List, Ring)
    [random, Height]
  Usage
    random(d, R)
  Inputs
    d:{ZZ,List} -- the degree or multi-degree to use
    R:Ring
  Outputs
    :RingElement
      a random homogeneous element of the ring @TT "R"@ of degree @TT "d"@
  Description
    Example
      R = ZZ[x,y]
      random(5, R)
      R = GF(25, Variable => a)[x, y];
      VerticalList for i to 6 list random(3, R)
    Text
      The length of @TT "d"@, if it's a list, should be the same as @TO2 (degreeLength, "degree rank")@ of $R$.
  SeeAlso
    setRandomSeed

Node
  Key
    (random, ZZ,   Ideal)
    (random, List, Ideal)
  Headline
    make a random matrix from an ideal
  Usage
    random(d, I)
    random(L, I)
  Inputs
    d:{ZZ,List} -- the degree, multi-degree, or a list of degrees
    I:Ideal -- in a graded ring
  Outputs
    :Matrix -- containing a row of homogeneous elements with prescribed degrees
  Description
    Text
      This function produces a vector of homogeneous elements of an ideal.
    Example
      S = ZZ/101[x, y]
      I = ideal"x2, y2"
      random(2, I)
      random({3, 3}, I)
      R = ZZ/101[x, y, z, Degrees => {{1,0}, {-1,1}, {0,1}}]
      J = ideal"x2, y2, z2"
      random({{2, 2}}, J)
      random(toList(3:{1, 1}), J)
  SeeAlso
    (random, List, Ring)

Node
  Key
    (random, List)
  Headline
    shuffle a list randomly
  Usage
    random L
  Inputs
    L:List
  Outputs
    :List
      a new list containing the elements of @TT "L"@ in a shuffled random order
  Description
    Example
      random toList (0 .. 12)
  SeeAlso
    setRandomSeed
///

document {
     Key => {(random, Module, Module),[random, MaximalRank],[random, Density],[random, UpperTriangular]},
     Headline => "make a random module map",
     Usage => "f = random(F,G)",
     Inputs => {
	  "F" => {"a free module"},
	  "G" => {"a free module"},
	  MaximalRank => {"whether to ensure that the resulting map has maximal rank: designed mostly
	       for use with matrices of numbers: for polynomial rings, returns inhomogeneous results"},
	  Density => RR => {"the proportion of entries to set"},
	  UpperTriangular => Boolean => {"whether to set just entries strictly above the diagonal"}
	  },
     Outputs => {"f" => {"a random, graded, degree ", TT "0", " map, from ", TT "G", " to ", TT "F"}},
     EXAMPLE lines ///
	  R = ZZ/101[x,y];
	  random(R^{1,2,3},R^{1,2,3})
	  random(ZZ^3,ZZ^6,MaximalRank=>true)
	  random(ZZ^3,ZZ^10,Density=>.3)
	  random(ZZ^6,ZZ^6,UpperTriangular=>true)
	  ///,
     Caveat => {
	  "Over a polynomial ring, specifying ", TT "MaximalRank=>true", " will yield a non-homogeneous matrix."
	  },
     SeeAlso => {"setRandomSeed"}
     }

document { Key => {(randomMutableMatrix, ZZ, ZZ, RR, ZZ),
	  [randomMutableMatrix,Dense],
	  randomMutableMatrix},
     Headline => "a random mutable matrix of integers",
     Usage => "randomMutableMatrix(nrows,ncols,zerof,max)",
     Inputs => {
	  "nrows",
	  "ncols",
	  "zerof" => { "between 0 and 1" },
	  "max",
	  Dense => {"whether the encoding of the matrix should be dense or not: see ", TO MutableMatrix}
	  },
     Outputs => {
	  {"a random mutable ", TT "nrows", " by ", TT "ncols", " matrix of integers.
	       The absolute value of the
	       entries is less than ", TT "max", ", and
	       the frequency of entries equal to zero is given by ", TT "zerof", "." }
	  },
     "This function has been superseded by ", TO fillMatrix, ", which works over
     more rings, is much faster for large matrices, and is more flexible.",
     EXAMPLE lines ///
       randomMutableMatrix(10,15,.9,100)
     ///,
     SeeAlso => {mutableMatrix, fillMatrix, setRandomSeed, random}
     }

document {
     Headline => "fill a mutable matrix with random numbers",
     Key => {fillMatrix,(fillMatrix, MutableMatrix),(fillMatrix, MutableMatrix, ZZ),
	  [fillMatrix, Height],[fillMatrix,Density],[fillMatrix,UpperTriangular]},
     Usage => "fillMatrix M\nfillMatrix(M,n)",
     BaseFunction => fillMatrix,
     Inputs => {
	  "M"=>MutableMatrix,
	  "n" => ZZ => {"if specified, the maximum number of entries to replace"},
	  Density => RR => {"the fraction of entries of ", TT "M", " to be replaced, if ", TT "n", " is
	       not specified"},
	  UpperTriangular => Boolean => "whether to fill entries only above the diagonal",
	  Height => ZZ => "a bound on the absolute values of the generated random numbers"
	  },
     Outputs => {"M"},
     Consequences => {{ "some entries of M are replaced with randomly generated numbers, whose
	       size depends on the value of the option ", TT "Height" }},
     EXAMPLE lines ///
	  printingPrecision = 2
	  fillMatrix(mutableMatrix(RR,5,10))
	  fillMatrix(mutableMatrix(ZZ,5,10),UpperTriangular=>true)
	  fillMatrix(mutableMatrix(QQ,5,10),Density=>.2,Height=>1000)
	  fillMatrix(mutableMatrix(ZZ,5,10),25,Height=>1000)
	  ///,
     SeeAlso => {setRandomSeed, random, mutableMatrix}
     }
