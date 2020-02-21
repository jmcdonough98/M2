#ifndef _word_table_hpp_
#define _word_table_hpp_

#include <vector>
#include <ostream>
#include <memory>

#include "FreeMonoid.hpp"
#include "../Polynomial.hpp"
#include "Word.hpp"

// TODO
// have a vector std::vector<int> of indices of each word.
//   an index of -1 means that that element has been removed.
// changes to code:
//   insert: push_back of the index, return that index.
//   routines that search over words in the table:
//     each should continue from any element with -1, ignoring it.
//   retire(index): set index to -1, set word to null's.
// move Word code to Word.hpp DONE

class FreeAlgebra;

using Overlap = std::tuple<int,int,int>;

class WordTable
{
  // abstract table class.
public:
  friend std::ostream& operator<<(std::ostream& o, const WordTable& wordTable);

  WordTable() {}

  ~WordTable() {}

  void clear() { mMonomials.clear(); }

  size_t monomialCount() const { return mMonomials.size(); }

  size_t insert(Word w);

  size_t insert(Word w, std::vector<Overlap>& newRightOverlaps);

  // access routine
  const Word& operator[](int index) const { return mMonomials[index]; }

  // lookup routines
  
  // return all pairs (i,j), where
  //   the i-th word in the table is w (say)
  //   j is a position in word
  //   such that w appears in word starting at position j.
  void subwords(Word word,
                std::vector<std::pair<int,int>>& output) const;

  // sets 'output' to the first pair (i,j), where
  //   the i-th word in the table is w (say)
  //   j is a position in word
  //   such that w appears in word starting at position j.
  // if such a match is found, output is set, and true is returned.
  // if not, false is returned.
  bool subword(Word word,
                std::pair<int,int>& output) const;

  // returns true if some element in the table is a prefix/suffix of 'word'.
  // In this case, 'output' is set to the index of the corresponding element.
  bool isPrefix(Word word, int& output) const;
  bool isSuffix(Word word, int& output) const;
  
  auto isNontrivialSuperword(Word word, int index1, int index2) const -> bool;
  
  // return all pairs (i,j), where
  //   the i-th word in the table is w (say)
  //   j is a position in w
  //   such that word appears in w starting at position j.
  void superwords(Word word,
                  std::vector<std::pair<int,int>>& output) const;
  
  // given 'word', find all left over laps with elements of the table.
  // A left overlap of 'alpha' and 'beta' is:
  //  a prefix of alpha is a suffix of beta.
  // i.e. alpha = a.b
  //      beta  = c.a (a,b,c are words)
  // returned Overlap for this overlap:
  void leftOverlaps(std::vector<Overlap>& newLeftOverlaps) const;

  // find (right) overlaps with most recent added word 'w'.
  void rightOverlaps(std::vector<Overlap>& newRightOverlaps) const; 

private:
  // returns true if word1 is a prefix/suffix of word2
  static bool isPrefixOf(Word word1, Word word2);
  static bool isSuffixOf(Word word1, Word word2);
  
  static void subwordPositions(Word word1,
                               Word word2,
                               std::vector<int>& result_start_indices);

  static bool subwordPosition(Word word1,
                               Word word2,
                               int& result_start_index);
  
  // overlaps here: suffix of word1 == prefix of word2.
  // overlap value is the start of prefix of word2 in word1.
  static void overlaps(Word word1,
                       Word word2,
                       std::vector<int>& result_overlaps);

private:
  std::vector<Word> mMonomials;
  std::vector<int> mIndices; // -1 means word was retired, cannot be used in this class any longer.
};

std::ostream& operator<<(std::ostream& o, const WordTable& wordTable);


#endif

// Local Variables:
// compile-command: "make -C $M2BUILDDIR/Macaulay2/e "
// indent-tabs-mode: nil
// End:

