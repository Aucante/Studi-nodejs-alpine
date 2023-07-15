const assert = require('assert');
const http = require('http');

const API_HOST = process.env.API_HOST
const port = 3000;

describe('Hello world', () => {
  it('should return "Hello world"', (done) => {
    http.get(`http://${API_HOST}:${port}`, (res) => {
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