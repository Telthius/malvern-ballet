// Font Loading API implementation
function showContent() {
  document.body.classList.add('fonts-loaded');
}

function loadFonts() {
  // Check if Font Loading API is supported
  if ('fonts' in document) {
    // Check if fonts are already loaded
    if (document.fonts.status === 'loaded') {
      showContent();
    } else {
      // Wait for all fonts to load
      document.fonts.ready.then(function() {
        showContent();
      });
    }
  } else {
    // Fallback for browsers without Font Loading API
    // Show content after a short delay
    setTimeout(function() {
      showContent();
    }, 100);
  }
}

// Handle initial page load
document.addEventListener('DOMContentLoaded', loadFonts);

// Handle Turbo navigation
document.addEventListener('turbo:load', function() {
  // Always show content on subsequent page loads since fonts are already loaded
  showContent();
});
