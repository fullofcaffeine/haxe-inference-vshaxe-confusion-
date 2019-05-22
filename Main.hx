import Extern.Middleware;
import Extern.MiddlewareHttp;

class Main {

  static function main() {
    var mw: MiddlewareHttp;
    /*
      Use vshaxe 2.11.0 (vscode 1.34.0) and Haxe 4.0.0-rc.2+77068e1

      These are dummy externs made to isolate a weird behaviour I've found when using the express externs from haxe-js-kit.

      The extern is defined in Extern.hx. There are two overaloads for the `use` method, one for
      a call with a path and another one without. Then, the Rest param has a type param of `AbstractMiddleware`
      that is a chain of EitherTypes defining the various kind of callback func params that can be provided.

      Below is a list of most possible combos for the overload/callback func+params.

      To reproduce the strange completion behaviour, do the following, considering you have this file
      opened in vscode with vshaxe setup correctly:
      1) Hover you mouse over any of the param variables. It's important to hover exactly over the var and wait a few moments;
      2) You'll see a popup with the following:
        |----------|
        |   a: ?   |
        |----------|
        | argument |
        |----------|
       
       Where a could be a, b, c or d (any of the params).

      3) However, if you hover the mouse anywhere in the anonymous function other than the specific vars (the function should highlight),
      you'll see the proper type info, for example:

        |------------------------------------------------
        | a: Extern.Request, b: Extern.Response -> Void |
        |-----------------------------------------------|
        | for argument middleware:AbstractMiddleware    |
        |-----------------------------------------------|
      
      This provides for terrible UX. It's clear Haxe knows the type for the params, but the information
      given back to the user depends on where she hovers the mouse, and while in the more "general" type
      info above the types are correctly shown, if you hover over a specific param (or pass it over to $type())
      Haxe/vshaxe shows `?` / `<Unknown<0>>`.

      Why? Is this a bug or a limitation of Haxe / completion server (or perhaps vshaxe)?
    */

    mw.use(function(a, b) {});
    mw.use(function(a, b, c) {});
    mw.use(function(a, b, c, d) {});

    mw.use('/foo', function(a, b) {});
    mw.use('/foo', function(a, b, c) {});
    mw.use('/foo', function(a, b, c, d) {});
  }

}
