window.name = "window";

action = function(greeting) {
  console.log(greeting + " " + this.name);
}

action("hello");

window.name = "window";

object = {
  name: "object",
  
  action: function() {
    nestedAction = function(greeting) {
      console.log(greeting + " " + this.name);
    }
    
    nestedAction("hello");
  }
}

object.action("hello");

// hello window

