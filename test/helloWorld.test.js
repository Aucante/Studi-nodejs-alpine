const assert = require('assert');
const http = require('http');

const hostname = '0.0.0.0';
const port = 3000;

describe('Hello world', () => {
  it('should return "Hello world"', (done) => {
    http.get(`http://${hostname}:${port}`, (res) => {
      let data = '';
      res.on('data', (chunk) => {
        data += chunk;
      });
      res.on('end', () => {
        assert.strictEqual(data, 'Hello world\n');
        done();
      });
    });
  });
});