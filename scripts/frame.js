// Generated by CoffeeScript 1.4.0
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  define(["paper"], function(paper) {
    var Frame;
    return Frame = (function() {

      function Frame(canvas, options) {
        this.setVelocity = __bind(this.setVelocity, this);

        this.getVelocity = __bind(this.getVelocity, this);

        var key, value;
        this.config = {
          editable: false,
          verticalOffset: 20,
          horizontalOffset: 20
        };
        this.canvas = canvas;
        this.paper = new paper.PaperScope();
        for (key in options) {
          value = options[key];
          this.config[key] = value;
        }
      }

      Frame.prototype.getVelocity = function() {
        return this.config.velocity;
      };

      Frame.prototype.setVelocity = function(velocity) {
        return this.config.velocity = velocity;
      };

      return Frame;

    })();
  });

}).call(this);