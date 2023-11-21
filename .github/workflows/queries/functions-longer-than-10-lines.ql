/**
 * @description Find functions that are long af
 * @kind problem
 * @id javascript/functions-longer-than-10-lines
 * @problem.severity recommendation
 */
import javascript

predicate longAf(Function funk) {
  funk.getNumLines() > 10
}

from Function funky
where longAf(funky)
select funky, "is long af"