import { Controller } from "@hotwired/stimulus"

/*
  Core Concepts of Stimulus

  1. Controllers
    Stimulus controllers are JavaScript classes that manage the behavior of elements on the page.
    Each controller is responsible for a specific aspect of interactivity.

  2. Targets
    Targets are specific elements within a controller's scope that you want to interact with.
    You define these in your HTML and reference them in your controller.

  3. Actions
    Actions bind DOM events (like click, submit, etc.) to controller methods, allowing you to define behavior directly in your HTML.

  4. Scopes
    A scope is the boundary of a Stimulus controller.
    It's the DOM element where the data-controller attribute is declared, along with all its children.

  ------------------------------------------------------------------------------------------------------------

  How Stimulus Works | Declare Behavior in HTML

  1. Add data-controller to the HTML element to connect it to a Stimulus controller.
  2. Use data-action to bind events to controller methods.
  3. Use data-[controller]-target to mark elements you want to reference.
  4. Define JavaScript Controllers
    - Create a JavaScript class that extends Stimulus.Controller and define methods for interactivity.

  Stimulus automatically scans the DOM for elements with data-controller and connects them to their respective controllers
*/

// Connects to data-controller="posts"
export default class extends Controller {
  static targets = ["title"]

  connect() {
    this.postID = this.element.dataset.postId
  }

  toggleTitle() {
    if(this.title) {
      this.title = ""
    } else {
      this.title = "Stimulus rocks!"
    }

    this.titleTarget.textContent = this.title
  }
}
