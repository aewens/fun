// Generated by CoffeeScript 1.7.1
(function() {
  define(function() {
    var $;
    $ = {
      create: function(selector, id) {
        var elem;
        elem = document.createElement(selector);
        if (id !== void 0) {
          elem.id = id;
        }
        return $.load(elem);
      },
      query: function(selector) {
        return document.querySelectorAll(selector)[0];
      },
      get: function(selector) {
        var element;
        element = $.query(selector);
        if (element === void 0) {
          return null;
        } else {
          return element;
        }
      },
      mult: function(element) {
        return element.length === 1;
      },
      many: function(element) {
        if ($.mult(element)) {
          return element[0];
        } else {
          return element;
        }
      },
      find: function(selector) {
        var element;
        element = $.query(selector);
        if (element === void 0) {
          return null;
        }
        return $.load($.many(element));
      },
      wrap: function(term) {
        if (term instanceof HTMLElement) {
          return $.load(term);
        } else {
          return $.find(term);
        }
      },
      unwrap: function(obj) {
        return obj.ret;
      },
      load: function(element) {
        var obj;
        obj = {
          ret: element,
          add: function(dom) {
            element.appendChild(dom.element);
            return $.load(element);
          },
          into: function(elem) {
            elem.appendChild(element);
            return $.load(element);
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
        return obj;
      }
    };
    return $;
  });

}).call(this);