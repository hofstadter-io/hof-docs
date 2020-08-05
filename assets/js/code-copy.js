console.log("GOT HERE")

function addCopyButtons(clipboard) {
  document.querySelectorAll('div .highlight').forEach(function (codeBlock) {

    // Need to now find the pre blocks in the table
    var nodes = codeBlock.querySelectorAll("pre");
    // And get the second one, the first is line numbers
    var codeContent = nodes[1];
    var codeID = codeBlock.previousElementSibling;

    // Create the copy button
    var button = document.createElement('button');
    button.className = 'border border-secondary float-right text-ivory bg-secondary';
    button.innerText = 'Copy';

    // Create the copy listener
    button.addEventListener('click', function () {
      var code = codeContent.innerText
      console.log(codeID.id)
      console.log(code)

      if (dataLayer === undefined || typeof dataLayer.push !== 'function') {
        console.warn("No GTM")
        return;
      } else {
        const args = {
          event: 'clipboard.docs',
          category: 'clipboard',
          action: 'copied',
          label: window.location.pathname,
          value: codeID.id,
        };
        dataLayer.push(args)
      }

      clipboard.writeText(code).then(function () {
        /* Chrome doesn't seem to blur automatically,
           leaving the button in a focused state. */
        button.blur();

        button.innerText = 'Copied!';

        setTimeout(function () {
          button.innerText = 'Copy';
        }, 2000);
      }, function (error) {
        button.innerText = 'Error';
        console.error(error)
      });
    });

    // Attach the button to the code
    codeBlock.insertBefore(button, codeBlock.firstChild)

  });

}

if (navigator && navigator.clipboard) {
    addCopyButtons(navigator.clipboard);
} else {
    var script = document.createElement('script');
    script.src = 'https://cdnjs.cloudflare.com/ajax/libs/clipboard-polyfill/2.7.0/clipboard-polyfill.promise.js';
    script.integrity = 'sha256-waClS2re9NUbXRsryKoof+F9qc1gjjIhc2eT7ZbIv94=';
    script.crossOrigin = 'anonymous';
    script.onload = function() {
        addCopyButtons(clipboard);
    };

    document.body.appendChild(script);
}
