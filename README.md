# GeneCpGFinder

An R package for fast genomic information search of human genes.

## Installation

```r
# Install from GitHub
devtools::install_github("Islam-DS/GeneCpGFinder")

# Load package
library(GeneCpGFinder)
```

## Quick Start

```r
# Show usage guide
quick_start()

# Fast gene search
fast_gene_search("TP53")
fast_gene_search("BRCA1")

# Check database status
check_database()

# Search multiple genes
search_multiple_genes(c("TP53", "BRCA1", "EGFR"))

# Get cancer genes list
get_cancer_genes()
```

## Features

-  **Instant gene search** - 78,656 human genes
-  **Local database** - No internet connection needed
-  **Cancer-focused** - Pre-curated cancer genes list
-  **Simple interface** - Easy to use functions

## Available Functions

- `fast_gene_search("GENE_NAME")` - Search for gene information
- `check_database()` - Show database statistics  
- `get_cancer_genes()` - Get common cancer genes list
- `search_multiple_genes()` - Search multiple genes at once
- `quick_start()` - Show usage guide

## Database Information

- **Total genes:** 78,656
- **Chromosomes:** 24 (1-22, X, Y)
- **Source:** ENSEMBL BioMart
- **Size:** ~1 MB

## Example

```r
# Load package
library(GeneCpGFinder)

# Search for TP53 gene
result <- fast_gene_search("TP53")
print(result)

# Output:
# FAST: Found in DATABASE - TP53
# hgnc_symbol chromosome_name start_position end_position
# 1        TP53           chr17        7661779      7687546
```

## Support

For issues and feature requests, please visit:  
https://github.com/Islam-DS/GeneCpGFinder/issues
