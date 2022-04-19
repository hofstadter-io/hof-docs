package example

import "encoding/json"

run: {
  @task(api.Serve)
  port: "2323"
  routes: {
    // static response
    "/hello": {
      method: "GET"
      resp: {
        status: 200
        body: "hallo chat!"
      }
    }

    // CUE value manipulation based
    "/echo": {
      method: ["get", "post"]
      req: _
      // resp: req.query
      resp: json: req.query.cow
    }

    // sub-flow based request handler
    "/pipe": {
      @flow()
      req: _
      // read and return a JSON file contents
      r: { filename: req.query.filename[0], contents: string } @task(os.ReadFile)
      j: json.Unmarshal(r.contents)
      resp: {
        status: 200
        json: j
      }
    }
  }
}

