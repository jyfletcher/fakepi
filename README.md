# FAkePI

---

## Background

FAkePI is a fake or mock HTTP API server. The data is randomly generated, but done in a way that is meant to resemble real data.

Each endpoint contains independent data but references data in the other endpoints so a client program can join the data. It was written to demonstrate the capabilities of a GraphQL server where data from various backend API's could be joined into one GraphQL response.

By default 100 Customers, Employees, Companies, and Products are generated so there is a decent amount of data to work with. This can be changed by modifying the gendata() function.

## Requirements

The CherryPy library will need to be installed. Installation and documentation for CherryPy is here: [https://cherrypy.dev/](https://cherrypy.dev/). Usually it is found in your system's package manager.

The other imports are part of Python's stdlib.

## Usage
```
$ fakepi

8<-----
ENGINE Started monitor thread 'Autoreloader'.
ENGINE Serving on http://127.0.0.1:8181
ENGINE Bus STARTED
```

By default is will listen only on 127.0.0.1:8181, but this can be changed in the main() function.

Note the data is persistent while the process is running, but completely new data will be generated every time the program is run.

## Example
```
$ http GET 127.0.0.1:8181/customer

8<-----
    {
        "Age": "45",
        "CustomerID": "46532",
        "FullName": "Kristen Sharpe",
        "OwnedProducts": [
            "57879",
            "98959",
            "96264",
            "32930",
            "19120"
        ]
    }
]
```

## Endpoints

* /customer
    * /customer?customerid=(customer id)
    * /customer?productid=(product id)
    * /customer?name=(substring matching and case insensitive)

* /company
    * /company?companyid=(company id)

* /product
    * /product?productid=(product id)
    * /product?companyid=(company id)

* /employee
    * /employee?employeeid=(employee id)
    * /employee?companyid=(company id)

Note: Since the data is random, valid names and ID's can be found by first querying without parameters.

## Performance

FAkePI is not designed to be highly performant. However, it is light-weight and generates the data on startup so runtime performance should be consistent and could be useful in integration performance testing where deltas are evaluated.
