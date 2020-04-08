# WebGraph

Example database to provide class diagram using web server

## How it works?

A method provide through the 4d server the diagram as plain text

```4d
WEB SEND TEXT(csDiagram (cs).mermaid().source)
```

[WebSendCSGraph.4dm](Project/Sources/Methods/WebSendCSGraph.4dm
)

Then in WebFolder we use [webpack](https://webpack.js.org/) to deliver [mermaid.js](https://mermaidjs.github.io/#/) library to the index.html page.

> With this library any block with the class "mermaid" will replace the plain text diagram with images


### Build the index.bundle.js

If you want to rebuild the javascript included in index.html, maybe with other dependencies:

Install the dependencies using

```
yarn install
```

> A `node_modules` folder is created with all the dependencies defined in package.json

Then to build index.bundle.js, _as defined in [webpack.config.js](WebFolder/webpack.config.js)_, launch the command

```
yarn build
```

> ⚠️ All dependencies must be imported into [index.js](WebFolder/index.js)
