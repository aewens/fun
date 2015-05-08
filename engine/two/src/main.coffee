@App = window.App ? {}
Pappai = @App.Pappai

w = 960
h = w * 9/16

Pappai.Init(w, h, true)

canvas = document.getElementById "pappai"
ctx    = canvas.getContext "2d"
