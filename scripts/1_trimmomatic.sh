#!/bin/bash

# Define directories
input_dir="./raw_data_paired_fastq_files"
output_dir="./trimmed"

# Define the samples you want to process
#samples=("AG006")
samples=("AG016" "AG040" "AG054" "AG058" "MT012" "MT017" "MT020" "MT022" "MT033" "MT037" "MT042" "MT047" "MT055" "MT058" "MT059" "MT060" "MT07")  # Add sample names here

# Create output directory if it doesn't exist
mkdir -p "$output_dir"

# Loop through the specified samples
for sample in "${samples[@]}"; do
    file1="$input_dir/${sample}_R1_001.fastq.gz"
    file2="$input_dir/${sample}_R2_001.fastq.gz"
    
    # Check if both R1 and R2 files exist
    if [[ -f "$file1" && -f "$file2" ]]; then
        # Run Trimmomatic
        java -jar ~/Trimmomatic-0.39/trimmomatic-0.39.jar PE \
            "$file1" "$file2" \
            "$output_dir/${sample}_R1_paired.fq.gz" \
            "$output_dir/${sample}_R1_unpaired.fq.gz" \
            "$output_dir/${sample}_R2_paired.fq.gz" \
            "$output_dir/${sample}_R2_unpaired.fq.gz" \
            ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 \
            LEADING:3 TRAILING:3 SLIDINGWINDOW:4:10 MINLEN:33
    else
        echo "Warning: One or both files for sample $sample do not exist."
    fi
done

