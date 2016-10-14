# http-utils

> Helper utilities for [Luvit.io](http://luvit.io) servers.

## Install

You can install all libraries as one dependency:

```bash
lit install voronianski/http-utils
```

## Modules

Or install every library separately:

## http-methods

HTTP verbs that Luvit.io aim to support.

```bash
lit install voronianski/http-methods
```

---

## mimes

Mime type getter from string.

```bash
lit install voronianski/mimes
```

```lua
local mimes = require('mimes')

p(mimes.getType('foo.jpg'))
-- 'image/jpeg'

```

---

## match-path

Match an Express.js-style path string such as `/user/:name` and get params.

```bash
lit install voronianski/match-path
```

```lua
local matchPath = require('match-path')

local parse = matchPath.compile('/foo/:bar')
-- parsing function

local params = parse('/foo/1')
-- {foo = '1'}
```

---

## on-headers-event

Patches [HTTP ServerResponse](https://luvit.io/api/http.html#http_class_http_serverresponse) with  `'headers'` event which executes a listener when a response is about to write headers.

```bash
lit install voronianski/on-headers-event
```

```lua
-- patches http.ServerResponse:flushHeaders method
require('on-headers-event')

require('http').createServer(function (req, res)
  res:on('headers', function 
    -- do something with headers before they are sent
  end)
  res:finish()
end):listen(3000)
```

---

## response-methods

Patches [HTTP ServerResponse](https://luvit.io/api/http.html#http_class_http_serverresponse) with useful response shortcut methods.

```bash
lit install voronianski/response-methods
```

```lua
-- adds helpful http.ServerResponse methods
require('response-methods')

local Utopia = require('utopia')
local app = Utopia:new()

app:listen(3000)
```

##### `res:status(code)`

```lua
res:status(403):finish()
res:status(400):send('Bad Request')
res:status(404):sendFile('/absolute/path/to/404.png')
```

##### `res:json(table)`

```lua
res:json({user = 'tobi'})
res:status(500):json({error = 'message'})
```

##### `res:redirect([status], path)`

```lua
res:redirect('/foo/bar')
res:redirect('http://example.com')
res:redirect(301, 'http://example.com')
res:redirect('../login')
```

##### `res:send([body])`

```lua
res:send(Buffer:new('whoop'))
res:send({some = 'json' })
res:send('<p>some html</p>')
res:status(404).send('Sorry, we cannot find that!')
res:status(500).send({error = 'something blew up'})
```

##### `res:sendStatus(code)`

```lua
res:sendStatus(200) -- equivalent to res:status(200):send('OK')
res:sendStatus(403) -- equivalent to res:status(403):send('Forbidden')
res:sendStatus(404) -- equivalent to res:status(404):send('Not Found')
res:sendStatus(500) -- equivalent to res:status(500):send('Internal Server Error')
```

##### `res:sendFile(path, [options], [fn])`

## License

MIT Licensed

Copyright (c) 2016 Dmitri Voronianski [dmitri.voronianski@gmail.com](mailto:dmitri.voronianski@gmail.com)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
