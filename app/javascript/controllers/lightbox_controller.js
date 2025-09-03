import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { 
    imageUrl: String,
    imageAlt: String 
  }

  open() {
    console.log('Lightbox open triggered', this.imageUrlValue)
    // Create lightbox overlay
    const overlay = document.createElement('div')
    overlay.className = 'fixed inset-0 bg-black bg-opacity-90 z-50 flex items-center justify-center p-4'
    overlay.id = 'lightbox-overlay'
    
    // Create image container
    const imageContainer = document.createElement('div')
    imageContainer.className = 'relative max-w-7xl max-h-full'
    
    // Create image
    const image = document.createElement('img')
    image.src = this.imageUrlValue
    image.alt = this.imageAltValue
    image.className = 'max-w-full max-h-full object-contain rounded-lg shadow-2xl'
    
    // Create close button
    const closeButton = document.createElement('button')
    closeButton.innerHTML = `
      <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
      </svg>
    `
    closeButton.className = 'absolute top-4 right-4 bg-black bg-opacity-50 hover:bg-opacity-70 rounded-full p-2 transition-all duration-200'
    closeButton.addEventListener('click', this.close.bind(this))
    
    // Create loading spinner
    const spinner = document.createElement('div')
    spinner.className = 'absolute inset-0 flex items-center justify-center'
    spinner.innerHTML = `
      <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-white"></div>
    `
    
    // Assemble the lightbox
    imageContainer.appendChild(image)
    imageContainer.appendChild(closeButton)
    imageContainer.appendChild(spinner)
    overlay.appendChild(imageContainer)
    
    // Add to document
    document.body.appendChild(overlay)
    document.body.style.overflow = 'hidden'
    
    // Handle image load
    image.onload = () => {
      spinner.remove()
    }
    
    // Handle image error
    image.onerror = () => {
      spinner.remove()
      image.alt = 'Failed to load image'
    }
    
    // Close on overlay click
    overlay.addEventListener('click', (e) => {
      if (e.target === overlay) {
        this.close()
      }
    })
    
    // Close on escape key
    this.escapeHandler = (e) => {
      if (e.key === 'Escape') {
        this.close()
      }
    }
    document.addEventListener('keydown', this.escapeHandler)
  }
  
  close() {
    const overlay = document.getElementById('lightbox-overlay')
    if (overlay) {
      overlay.remove()
      document.body.style.overflow = ''
      document.removeEventListener('keydown', this.escapeHandler)
    }
  }
}
