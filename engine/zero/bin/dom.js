// Generated by CoffeeScript 1.7.1
(function() {
  define(function() {
    var $;
    $ = {
      create: function(selector) {
        var obj;
        obj = {
          element: document.createElement(selector),
          into: function(element) {
            element.appendChild(this.element);
            return Object.create(obj);
          },
          add: function(dom) {
            return this.element.appendChild(dom.element);
          }
        };
        return obj;
      },
      get: function(selector) {
        var element;
        element = document.querySelectorAll(selector)[0];
        if (element === void 0) {
          return null;
        } else {
          return element;
        }
      },
      find: function(selector) {
        var element;
        element = document.querySelectorAll(selector)[0];
        if (element === void 0) {
          return null;
        }
        return $.load(element.length === 1 ? element[0] : element);
      },
      load: function(element) {
        var ret;
        ret = {
          add: function(dom) {
            return element.appendChild(dom.element);
          },
          css: function() {
            var arg, k, v;
            switch (arguments.length) {
              case 1:
                arg = arguments[0];
                if (typeof arg === "object") {
                  for (k in arg) {
                    v = arg[k];
                    element.style[k] = v;
                  }
                  return $.load(element);
                } else if (typeof arg === "string") {
                  return element.style[arg];
                } else {
                  return $.load(element);
                }
                break;
              case 2:
                k = arguments[0];
                v = arguments[1];
                element.style[k] = v;
                return $.load(element);
              default:
                return $.load(element);
            }
          },
          on: function(event, fn) {
            element.addEventListener(event, fn);
            return $.load(element);
          },
          val: function() {
            switch (arguments.length) {
              case 0:
                return element.value;
              case 1:
                return element.value = arguments[0];
              default:
                return $.load(element);
            }
          },
          html: function() {
            switch (arguments.length) {
              case 0:
                return element.innerHTML;
              case 1:
                return element.innerHTML = arguments[0];
              default:
                return $.load(element);
            }
          },
          attr: {
            get: function(a) {
              return element.getAttribute(a);
            },
            set: function(k, v) {
              element.setAttribute(k, v);
              return $.load(element);
            },
            has: function(a) {
              return element.hasAttribute(a);
            }
          },
          group: {
            add: function(klass) {
              element.classList.add(klass);
              return $.load(element);
            },
            remove: function(klass) {
              element.classList.remove(klass);
              return $.load(element);
            },
            has: function(klass) {
              element.classList.contains(klass);
              return $.load(element);
            },
            toggle: function(klass) {
              element.classList.toggle(klass);
              return $.load(element);
            }
          }
        };
        return ret;
      }
    };
    return $;
  });

}).call(this);