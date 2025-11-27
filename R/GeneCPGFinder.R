#' @keywords internal
"_PACKAGE"

#' GeneCpGFinder: Fast Genomic Information Search
#'
#' A lightweight R package for instant gene information search
#' using local database of 78,656 human genes.
#' Provides ultra-fast access to genomic coordinates.
#'
#' @name GeneCpGFinder-package
#' @aliases GeneCpGFinder
#' @docType package
NULL

#' Quick Start Guide
#'
#' Shows basic usage examples and available functions
#' @export
#' @examples
#' quick_start()

quick_start <- function() {
  cat("🎯 GeneCpGFinder - Fast Gene Search\n")
  cat("=====================================\n")
  cat("📝 Usage: fast_gene_search('GENE_NAME')\n")
  cat("📝 Usage: check_database()\n")
  cat("📝 Usage: get_cancer_genes()\n")
  cat("\n")
  cat("🧬 Example searches:\n")
  cat("   fast_gene_search('TP53')\n")
  cat("   fast_gene_search('BRCA1')\n")
  cat("   fast_gene_search('EGFR')\n")
  cat("\n")
  cat("📊 Database: 78,656 human genes\n")
  cat("⚡ Speed: Instant results\n")
  cat("=====================================\n")
}

#' Ultra-Fast Gene Search
#'
#' Search for gene information in local database
#' @param gene_name Gene symbol (e.g., "TP53", "BRCA1")
#' @return Data frame with gene information
#' @export
#' @examples
#' fast_gene_search("TP53")
#' fast_gene_search("BRCA1")
fast_gene_search <- function(gene_name) {
  # Database path - direct local path use করুন
  db_path <- "D:/All R language/Creating R library/GeneCpGFinder/data/all_genes_database.rds"

  # Alternative path যদি উপরেরটি কাজ না করে
  if(!file.exists(db_path)) {
    db_path <- "data/all_genes_database.rds"
  }

  if(!file.exists(db_path)) {
    message("❌ Database not found at: ", db_path)
    message("💡 Current working directory: ", getwd())

    # Available files check
    if(dir.exists("data")) {
      message("💡 Files in data folder: ", paste(list.files("data"), collapse = ", "))
    }
    return(NULL)
  }

  # Fast database read and search
  db <- readRDS(db_path)
  result <- db[db$hgnc_symbol == gene_name, ]

  if(nrow(result) > 0) {
    message("⚡ FAST: Found in DATABASE - ", gene_name)
    return(result)
  } else {
    message("❌ Gene not found: ", gene_name)
    return(NULL)
  }
}

#' Check Database Status
#'
#' Shows database statistics and information
#' @export
#' @examples
#' check_database()
check_database <- function() {
  # Database path - direct local path
  db_path <- "D:/All R language/Creating R library/GeneCpGFinder/data/all_genes_database.rds"

  if(!file.exists(db_path)) {
    db_path <- "data/all_genes_database.rds"
  }

  if(file.exists(db_path)) {
    db <- readRDS(db_path)
    cat("✅ DATABASE STATUS:\n")
    cat("📊 Total genes:", nrow(db), "\n")
    cat("🔢 Chromosomes:", length(unique(db$chromosome_name)), "\n")
    cat("🎯 Sample genes:", paste(sample(na.omit(db$hgnc_symbol), 8), collapse = ", "), "\n")
  } else {
    cat("❌ Database not found at: ", db_path, "\n")
    cat("💡 Current directory: ", getwd(), "\n")
  }
}

#' Get Common Cancer Genes
#'
#' Returns a list of frequently studied cancer genes
#' @return Character vector of cancer gene symbols
#' @export
#' @examples
#' get_cancer_genes()

get_cancer_genes <- function() {
  c("TP53", "BRCA1", "BRCA2", "EGFR", "KRAS",
    "MYC", "PTEN", "PIK3CA", "ALK", "BRAF")
}

#' Search Multiple Genes
#'
#' Search for multiple genes at once
#' @param gene_list Vector of gene symbols
#' @export
#' @examples
#' search_multiple_genes(c("TP53", "BRCA1", "EGFR"))

search_multiple_genes <- function(gene_list) {
  results <- list()

  for(gene in gene_list) {
    result <- fast_gene_search(gene)
    if(!is.null(result)) {
      cat("✅", gene, "- Chr", result$chromosome_name, "\n")
      results[[gene]] <- result
    } else {
      cat("❌", gene, "- NOT FOUND\n")
    }
  }

  invisible(results)
}

# Auto-show quick start when package loads
.onAttach <- function(libname, pkgname) {
  packageStartupMessage("🎯 GeneCpGFinder loaded! Use quick_start() for guide.")
}
