(function () {
  function formatCount(count) {
    return Number(count).toLocaleString("en-US");
  }

  function updateStarCount(container, count) {
    var countLink = container.querySelector("[data-github-star-count]");
    if (!countLink) {
      return;
    }

    var formattedCount = formatCount(count);
    countLink.textContent = formattedCount;
    countLink.setAttribute("aria-label", formattedCount + " stargazers on GitHub");
  }

  Array.prototype.forEach.call(document.querySelectorAll("[data-github-star]"), function (container) {
    var repo = container.getAttribute("data-github-repo");
    if (!repo || !window.fetch) {
      return;
    }

    window
      .fetch("https://api.github.com/repos/" + repo, {
        headers: {
          Accept: "application/vnd.github+json",
        },
      })
      .then(function (response) {
        if (!response.ok) {
          throw new Error("GitHub API request failed");
        }
        return response.json();
      })
      .then(function (repoData) {
        if (typeof repoData.stargazers_count === "number") {
          updateStarCount(container, repoData.stargazers_count);
        }
      })
      .catch(function () {
        // Keep the server-rendered fallback count visible when the API is unavailable.
      });
  });
})();
