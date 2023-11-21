import javascript

predicate longAf(Function funk) {
  getNumLines(funk) > 10
}

from Function funky
where longAf(funky)
select funky, "is long af"