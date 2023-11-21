/**
 * @description Find tests that call pressActionKey
 * @kind problem
 * @id javascript/test-call-pressActionKey
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if a function is a test.
 */
predicate isTest(Function test) {
  exists(CallExpr describe, CallExpr it |
    describe.getCalleeName() = "describe" and
    it.getCalleeName() = "it" and
    it.getParent*() = describe and
    test = it.getArgument(1)
  )
}

/**
* Holds if `caller` contains a call to `callee`.
*/
predicate calls(Function caller, Function callee) {
  exists(DataFlow::CallNode call |
    call.getEnclosingFunction() = caller and
    call.getACallee() = callee
  )
}

predicate funkyName(Function funk, String name) {
  funk.getName() = name
}

from Function test, Function callee
where isTest(test) and
      calls(test, callee) and
      funkyName(callee, "pressActionKey")
select callee, "calls pressActionKey"