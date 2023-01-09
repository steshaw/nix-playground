# The ellipsis package calling trick

Here `callPackage` avoids the use of `functionArgs` by passing the entire
package collection (attrset) to each package function (derivation). These
package functions must use the `...` to ignore the additional parameters.
