// Font Loading API implementation
document.addEventListener('DOMContentLoaded', function() {
  // Check if Font Loading API is supported
  if ('fonts' in document) {
    // Wait for all fonts to load
    document.fonts.ready.then(function() {
      // Add class to show content
      document.body.classList.add('fonts-loaded');
    });
  } else {
    // Fallback for browsers without Font Loading API
    // Show content after a short delay
    setTimeout(function() {
      document.body.classList.add('fonts-loaded');
    }, 100);
  }
});
