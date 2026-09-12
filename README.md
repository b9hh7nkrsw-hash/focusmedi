# 📚 FocusMedi - MBBS Revision Web App with Local AI

A comprehensive, **offline-first web application** for MBBS students to revise all subjects using local AI, with support for:
- 🤖 **Local AI** (Ollama/LLaMA) - Fast, accurate, privacy-focused
- 📝 **Colorful PDF Notes Generation** (handwritten styles, multiple fonts)
- 🎨 **Diagram Extraction & Generation** (Pathology, Microbiology)
- 🎬 **Animation Video Generation** (Pathogenesis, bacterial mechanisms)
- 📋 **Subject-wise Organization** (Anatomy, Physiology, Pathology, Pharmacology, Microbiology, etc.)
- ✅ **Q&A Mode** with official guidelines (WHO, Indian Health Ministry)
- 🔒 **Privacy-First** - All data stays on your device
- 📱 **Mobile-Friendly** - Works on iOS, Android (no download needed)

## Features

### 1. **AI-Powered Revision**
- Chat with local AI about any MBBS topic
- Instant answers based on official guidelines
- Fast & accurate (Mistral/Medical-specialized models)

### 2. **Colorful PDF Notes Generation**
- Upload text/images → Generate beautiful PDF notes
- Handwritten font styles (Comic Sans, Segoe Print, etc.)
- Color-coded content by topic
- Automatic formatting & layout

### 3. **Diagram & Image Tools**
- Extract diagrams from internet for pathology/microbiology
- AI-generated anatomical diagrams
- Auto-fetch relevant images from medical sources
- Save & organize diagrams locally

### 4. **Animation Video Generator**
- Create animations for pathogenesis
- Bacterial lifecycle animations
- Disease mechanism videos
- Step-by-step physiological processes

### 5. **Subject-wise Modules**
- Anatomy
- Physiology
- Pathology
- Pharmacology
- Microbiology
- Biochemistry
- Community Medicine
- Forensic Medicine
- And more...

## Tech Stack

### Frontend
- **React 18** + TypeScript
- **Tailwind CSS** - Responsive design
- **Shadcn/ui** - Beautiful components
- **Framer Motion** - Animations
- **FFmpeg.wasm** - Video generation
- **jsPDF + html2canvas** - PDF generation
- **Axios** - API calls

### Backend
- **Node.js + Express.js**
- **Ollama** - Local LLM integration
- **ImageMagick** - Image processing
- **Puppeteer** - Web scraping (diagrams)
- **FFmpeg** - Video processing
- **SQLite** - Local data storage

## Installation

### Prerequisites
- Node.js 16+
- Ollama (for local AI)
- FFmpeg (for video generation)

### Quick Start

```bash
git clone https://github.com/b9hh7nkrsw-hash/focusmedi.git
cd focusmedi
npm install

# Setup Ollama
ollama pull mistral

# Start application
npm run dev
```

## License

MIT License
