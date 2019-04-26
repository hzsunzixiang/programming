def app(env, start_response):
    start_response('200 OK', [('Content-Type','text/html')])
    return [b"Hello World, in app nginx myapp"]
