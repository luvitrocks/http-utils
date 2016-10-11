# http-utils

> Helper utilities for [Luvit.io](http://luvit.io) servers.

## Install

You can install all libraries as one dependency:

```bash
lit install voronianski/http-utils
```

Or install every library separately:

### http-methods

HTTP verbs that Luvit.io aim to support.

```
lit install voronianski/http-methods
```

### mimes

Mime type getter from string.

```
lit install voronianski/mimes
```

```lua
local mimes = require('mimes')

p(mimes.getType('foo.jpg'))
-- 'image/jpeg'

```

### match-path

Match an Express.js-style path string such as `/user/:name` and get params.

```
lit install voronianski/match-path
```

```lua
local matchPath = require('match-path')

local parse = matchPath.compile('/foo/:bar')
-- parsing function

local params = parse('/foo/1')
-- {foo = '1'}
```

### on-headers-event

Add `'headers'` event and execute a listener when a response is about to write headers.

```
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
end)
```

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
