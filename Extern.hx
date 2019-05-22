package;

import haxe.extern.Rest;
import haxe.extern.EitherType;

// Just to avoid importing the complex types and for the sake of exemplifying
typedef Request = String;
typedef Response = String;
typedef Middleware = String;
typedef Route = String;
typedef Callback0 = String;

typedef MiddlewareNext = ?Dynamic->Void;
typedef MiddlewareHandler = (req: Request, res: Response, next: MiddlewareNext) -> Void;
typedef MiddlewareResponder = (req: Request, res: Response) -> Void;
typedef MiddlewareErrorHandler = (err: Dynamic, req: Request, res: Response, next: Callback0) -> Void;
typedef MiddlewareParam<P> = Request -> Response -> MiddlewareNext -> P -> Void;
typedef MiddlewareMethod = Route->Middleware->Void;

typedef AbstractMiddleware = 
	EitherType<MiddlewareErrorHandler,
		EitherType<MiddlewareResponder,
			EitherType<MiddlewareHandler, Middleware>
		>
	>;

extern class MiddlewareHttp
{
	@:overload( function ( path : Route , middleware : Rest<AbstractMiddleware> ) : MiddlewareHttp {} )
	public function use ( middleware : Rest<AbstractMiddleware> ) : MiddlewareHttp ;
}
