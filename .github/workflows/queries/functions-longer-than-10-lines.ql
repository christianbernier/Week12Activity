import javascript

predicate longAf(Function funk) {
  funk.getNumLines() > 10
}

from Function funky
where longAf(funky)
select funky, "is long af"