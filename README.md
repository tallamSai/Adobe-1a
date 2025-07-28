# Adobe Challenge 1A: Intelligent PDF Outline Extraction

*Team: 0NLY_FL4G$*

This system provides intelligent PDF document analysis and outline extraction, automatically detecting document structure, headings, and hierarchical organization using advanced font analysis and semantic understanding.

## Technical Approach

### Core Architecture

Our system implements a sophisticated *PDF structure analysis pipeline* that combines:

1. *Advanced PDF Text Extraction* (pdfplumber-based)
   - Character-level analysis for precise text positioning
   - Font size and style detection for hierarchical classification
   - Page-by-page content reconstruction with spatial awareness

2. *Multi-Stage Processing Pipeline*
   - *Character-Level Analysis*: Precise text extraction with font metadata
   - *Line Reconstruction*: Intelligent text grouping with spatial tolerance
   - *Font Size Classification*: Automatic heading detection using font size patterns
   - *Header/Footer Detection*: Smart identification of repeated elements
   - *Hierarchical Classification*: Multi-level heading structure extraction
   - *Title Extraction*: Intelligent document title identification

3. *Advanced Classification Algorithm*
   - *Font Size Analysis*: Primary classification using font size hierarchies
   - *Text Pattern Recognition*: Numbered headings, all-caps detection
   - *Spatial Analysis*: Position-based relevance scoring
   - *Content Quality Assessment*: Length and formatting analysis
   - *Contextual Filtering*: Removal of headers, footers, and artifacts

### Key Innovations

#### 1. Intelligent Character-Level Text Extraction
```python
def extract_lines(pdf_path):
    # Character-by-character analysis with spatial grouping
    # Font size and style preservation
    # Line reconstruction with intelligent spacing
    # Page position tracking for hierarchical analysis
```

#### 2. Multi-Dimensional Font Analysis
```python
def get_font_size_levels(lines):
    # Statistical font size distribution analysis
    # Automatic heading level classification
    # Font family and style detection
    # Relative size hierarchy establishment
```

#### 3. Advanced Heading Classification
```python
def classify_headings(lines, header_ys, footer_ys, repeated_texts, 
                     font_levels, significant_font_sizes, most_common_body_font_size):
    # Multi-factor heading detection
    # Font size-based hierarchy classification
    # Pattern recognition for numbered sections
    # All-caps text identification
    # Spatial positioning analysis
```

### Performance Optimizations

- *CPU-Only Execution*: No GPU dependencies, runs on any machine
- *Memory Efficient*: Stream-based PDF processing
- *Fast Processing*: Optimized character-level analysis
- *No Internet Required*: Fully offline operation
- *Robust Error Handling*: Graceful handling of malformed PDFs

### Quality Assurance

- *Precise Text Extraction*: Character-level accuracy with font preservation
- *Intelligent Filtering*: Automatic removal of headers, footers, and artifacts
- *Hierarchical Accuracy*: Multi-level heading structure detection
- *Context-Aware Processing*: Understanding of document layout and structure
- *Comprehensive Coverage*: Handles various PDF formats and layouts

## Dependencies

### Core Requirements
- **pdfplumber==0.9.0** - Advanced PDF text extraction
- **Pillow==9.5.0** - Image processing support
- **sentence-transformers==2.2.2** - Semantic text analysis
- **transformers==4.30.2** - Transformer model support
- **torch==2.0.1+cpu** - PyTorch CPU optimization
- **scikit-learn==1.3.0** - Machine learning utilities
- **numpy==1.24.4** - Numerical computing
- **tqdm==4.65.0** - Progress tracking
- **filelock==3.12.2** - File locking for concurrent access
- **huggingface-hub==0.16.4** - Model repository access
- **tokenizers==0.13.3** - Text tokenization
- **sentencepiece==0.1.99** - Subword tokenization

## Project Structure

```
0NLY_FL4G$-main/
├── main.py              # Main processing script
├── utils.py             # Core extraction and analysis functions
├── model.py             # Sentence transformer model setup
├── requirements.txt     # Python dependencies
├── dockerfile          # Docker configuration
├── input/              # Input PDF files
├── output/             # Generated JSON outputs
└── model/              # Downloaded model files
```

## Setup

### 1. Install Dependencies
```bash
pip install -r requirements.txt
```

### 2. Download Sentence Transformer Model
```bash
python model.py
```

This downloads the `all-MiniLM-L6-v2` model (~87MB) to the `./model/` directory.

### 3. Prepare Input Files
Place your PDF files in the `input/` directory.

## Usage

### Using Docker (Recommended)

#### For Windows (PowerShell/Command Prompt)

```powershell
# Navigate to project directory
cd "D:\Adobe-India-Hackathon25\0NLY_FL4G$-main"

# Build the Docker image
docker build -t adobe-challenge-1a .

# Run the container (PowerShell)
docker run --rm -v "${PWD}:/app" -w /app adobe-challenge-1a

# Alternative for Command Prompt
docker run --rm -v "%cd%:/app" -w /app adobe-challenge-1a
```

#### For Mac/Linux (Terminal)

```bash
# Navigate to project directory
cd /path/to/0NLY_FL4G$-main

# Build the Docker image
docker build -t adobe-challenge-1a .

# Run the container
docker run --rm -v "$(pwd):/app" -w /app adobe-challenge-1a
```

#### Docker Commands Explained

- `docker build -t adobe-challenge-1a .` - Builds the Docker image with tag "adobe-challenge-1a"
- `--rm` - Automatically removes the container after execution
- `-v "${PWD}:/app"` - Mounts current directory to /app in container
- `-w /app` - Sets working directory to /app in container

#### Troubleshooting Docker

**If you get permission errors on Linux/Mac:**
```bash
sudo docker build -t adobe-challenge-1a .
sudo docker run --rm -v "$(pwd):/app" -w /app adobe-challenge-1a
```

**If volume mounting fails on Windows:**
```powershell
# Use absolute path
docker run --rm -v "D:\Adobe-India-Hackathon25\0NLY_FL4G$-main:/app" -w /app adobe-challenge-1a
```

### Using Python Directly

```bash
# Install dependencies
pip install -r requirements.txt

# Download the model
python model.py

# Run the main processing script
python main.py
```

## Output Format

The system generates JSON files for each input PDF with the following structure:

```json
{
  "title": "Document Title",
  "outline": [
    {
      "level": "H1",
      "text": "Main Heading",
      "page": 1
    },
    {
      "level": "H2", 
      "text": "Sub Heading",
      "page": 2
    }
  ]
}
```

### Output Fields

- **title**: Extracted document title
- **outline**: Array of heading objects with:
  - **level**: Heading hierarchy level (H1, H2, H3, etc.)
  - **text**: Heading text content
  - **page**: Page number where heading appears

## Technical Features

### 1. Advanced PDF Analysis
- Character-level text extraction with font metadata
- Intelligent line reconstruction with spatial tolerance
- Font size and style preservation for hierarchical analysis

### 2. Smart Heading Detection
- Font size-based hierarchy classification
- Pattern recognition for numbered sections
- All-caps text identification for titles
- Spatial positioning analysis

### 3. Quality Filtering
- Automatic header/footer detection and removal
- Repeated text identification and filtering
- Content quality assessment
- Contextual relevance scoring

### 4. Robust Processing
- Handles various PDF formats and layouts
- Graceful error handling for malformed PDFs
- Memory-efficient streaming processing
- CPU-optimized execution

## Performance

- **Model Size**: ≤ 100MB (Sentence Transformer: 87MB)
- **Processing Time**: ≤ 10 seconds per PDF document
- **Memory Usage**: Optimized for low-memory environments
- **CPU-Only**: No GPU requirements
- **Offline Operation**: No internet access required during execution

## Supported Document Types

- **Technical Documents**: Manuals, specifications, guides
- **Business Documents**: Reports, proposals, contracts
- **Academic Papers**: Research papers, theses, articles
- **Legal Documents**: Contracts, agreements, policies
- **Government Documents**: Forms, regulations, guidelines

## Error Handling

The system includes robust error handling for:
- Malformed PDF files
- Missing font information
- Empty or corrupted pages
- Encoding issues
- Memory constraints

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is developed for the Adobe India Hackathon 2025.

## Team

*0NLY_FL4G$* - Adobe India Hackathon 2025 Participants

---

*Built with advanced PDF analysis techniques and intelligent document structure recognition.* 