package example

import "encoding/json"

@flow()
call: { 
  @task(api.Call)
  req: {
    host: "https://postman-echo.com"
    // method: "GET"
    path: "/get"
    query: {
      cow: "moo"
    }
  }
  resp: {
    body: {} // as a CUE value
    statusCode: 200
  }
}

out: { text: json.Indent(json.Marshal(call.resp.body), "", "  ") +"\n" } @task(os.Stdout)
