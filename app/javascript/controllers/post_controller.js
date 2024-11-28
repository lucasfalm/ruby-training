import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="post"
export default class extends Controller {
  connect() {
    this.postID = this.element.dataset.postId
  }

  view() {
    window.open(`/posts/${this.postID}`)
  }

  delete(event) {
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content;

    fetch(`/posts/` + this.postID, {
      method:  "DELETE",
      headers: {
        "X-CSRF-Token": csrfToken,
        "Content-Type": "application/json"
      }
    }).
      then((response) => {
        console.log(response)
      }).
      catch((error) => {
        console.error("Error:", error)
      })
  }
}
