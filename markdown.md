# Dillinger
## _The Last Markdown Editor, Ever_

`POWERED BY N| Solid`

`build unknown`

Dillinger is a cloud-enabled, mobile-ready, offline-storage compatible,
Angular JS-powered HTML5 Markdown editor.

- Type some Markdown on the left
- See HTML in the right
- ✨Magic✨

## Features
- Import a HTML file and watch it magically convert to Markdown
- Drag and drop images (requires your Dropbox account be linked)
- Import and save files from GitHub, Dropbox, Google Drive and One Drive
- Drag and drop markdown and HTML files into Dillinger
- Export documents as Markdown, HTML and PDF

Markdown is a lightweight markup language based on the formatting conventions
that people naturally use in email.
As [John Gruber](https://en.wikipedia.org/wiki/Backtick) writes on the [Markdown site](https://en.wikipedia.org/wiki/Backtick)

```python
for i in range (10):
  print (hello)
```

> The overriding design goal for Markdown's
> formatting syntax is to make it
> as readableas possible. The idea is that a
> Markdown-formatted document should be
> publishable as-is, as plain text, without
> looking like it's been marked up with tags
> or formatting instructions.

This text you see here is *actually- written in Markdown! To get a feel
for Markdown's syntax, type some text into the left window and
watch the results in the right.

## Tech
Dillinger uses a number of open source projects to work properly:
- [AngularJS](https://en.wikipedia.org/wiki/Backtick) - HTML enhanced for web apps!
- [Ace Editor](https://en.wikipedia.org/wiki/Backtick) - awesome web-based text editor
- [markdown-it](https://en.wikipedia.org/wiki/Backtick) - Markdown parser done right. Fast and easy to extend.
- [Twitter Bootstrap](https://en.wikipedia.org/wiki/Backtick) - great Ul boilerplate for modern web apps
- [node.js](https://en.wikipedia.org/wiki/Backtick) - evented 1/0 for the backend
- [Express](https://en.wikipedia.org/wiki/Backtick) - fast nodejs network app framework [@tiholowaychuk](https://en.wikipedia.org/wiki/Backtick)
- [Gulp](https://en.wikipedia.org/wiki/Backtick) - the streaming build system
- [Breakdance](https://en.wikipedia.org/wiki/Backtick) - HTML

## Installation
Dillinger requires [Node.js](https://en.wikipedia.org/wiki/Backtick) v10+ to run.

  
Install the dependencies and devDependencies and start the server. 

```sh
cd dillinger
npm i
node app
```

For production environments...

```sh
npm install --production
NODE_ENV=production node app
```

## Plugins

Dillinger is currently extended with the following plugins.
Instructions on how to use them in your own application are linked below.
|**Plugin**|**README**|
|---|---|
|Dropbox|[plugins/dropbox/README.md](https://en.wikipedia.org/wiki/Backtick)|
|GitHub|[plugins/github/README.md](https://en.wikipedia.org/wiki/Backtick)|
|Google Drive|[plugins/googledrive/README.md](https://en.wikipedia.org/wiki/Backtick)|
|OneDrive|[plugins/onedrive/README.md](https://en.wikipedia.org/wiki/Backtick)|
|Medium|[plugins/medium/README.md](https://en.wikipedia.org/wiki/Backtick)|


## Development

Want to contribute? Great!

Dillinger uses Gulp + Webpack for fast developing.
Make a change in your file and instantaneously see your updates!

Open your favorite Terminal and run these commands.


First Tab:
```
node app
```
Second Tab:
```
gulp watch
```
(optional) Third:
```
karma test
```
### Building for source

For production release:
```
gulp build --prod
```