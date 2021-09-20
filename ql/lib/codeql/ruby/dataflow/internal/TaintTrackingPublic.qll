private import ruby
private import TaintTrackingPrivate
private import codeql.ruby.CFG
private import codeql.ruby.DataFlow

/**
 * Holds if taint propagates from `source` to `sink` in zero or more local
 * (intra-procedural) steps.
 */
predicate localTaint(DataFlow::Node source, DataFlow::Node sink) { localTaintStep*(source, sink) }

/**
 * Holds if taint can flow from `e1` to `e2` in zero or more
 * local (intra-procedural) steps.
 */
predicate localExprTaint(CfgNodes::ExprCfgNode e1, CfgNodes::ExprCfgNode e2) {
  localTaint(DataFlow::exprNode(e1), DataFlow::exprNode(e2))
}

predicate localTaintStep = defaultAdditionalTaintStep/2;