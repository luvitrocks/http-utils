local ServerResponse = require('http').ServerResponse

function ServerResponse:status (code)
  self.statusCode = code

  return self
end

function ServerResponse:send (body)

  self:writeHead(self.statusCode, header)
  if data then
    self:write(data)
  end
  self:finish()
  collectgarbage()
end

function ServerResponse:json (tbl)
  self:setHeader('Content-Type', 'application/json')
  self:finish(JSON.stringify(tbl, opts))

  return self
end

function ServerResponse:redirect (code, url)
  if type(code) == 'string' then
    url = code
    code = 302
  end

  self:status(code):setHeader('Location', url)
  self:send()

  return self
end
