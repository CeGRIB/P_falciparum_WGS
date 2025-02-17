###**** Filter out with phred score less than 30 ***

filter_vcf <- function(input_vcf, output_vcf, qual_threshold = 30) {
  # Open the input and output files
  infile <- file(input_vcf, "r")
  outfile <- file(output_vcf, "w")
  
  # Read the input file line by line
  while (length(line <- readLines(infile, n = 1, warn = FALSE)) > 0) {
    # Write header lines to output
    if (startsWith(line, "#")) {
      writeLines(line, outfile)
      next
    }
    
    # Split the line into fields
    fields <- strsplit(line, "\t")[[1]]
    qual <- as.numeric(fields[6])
    
    # Check if the quality score is above the threshold
    if (qual > qual_threshold) {
      writeLines(line, outfile)
    }
  }
  
  # Close the files
  close(infile)
  close(outfile)
}

# Run the function
filter_vcf("SNP_anno_biallelic_3.recode.vcf", "SNP_phred_filtered_4.vcf", qual_threshold = 30)
