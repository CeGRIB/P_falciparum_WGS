#!/bin/bash


##1. Discard highly variable regions
##1a. Discard API variants
grep -v "Pf3D7_API_v3" SNP_anno.vcf > SNP_anno_1.vcf

##1a. Discard Mitochondrion variants
grep -v "Pf_M76611" SNP_anno_1.vcf > SNP_anno_2.vcf


##2a. Filter and retain only biallelic variants (variants with exactly 2 alleles)
##2b. Filters out variants with a depth (DP) less than 5. This applies to the per-site depth
vcftools --gzvcf SNP_anno_2.vcf --remove-filtered-all --min-alleles 2 --max-alleles 2 --minDP 5 --recode --recode-INFO-all --out SNP_anno_biallelic_3


##3. Calculate excessive missing
##3b. Calculate the percentage of missingness per individual (sample)
vcftools --vcf SNP_anno_biallelic_3.vcf --missing-indv --out missing_ind

##3.c Calculate the percentage of missingness per per site
vcftools --vcf SNP_anno_biallelic_3.vcf --missing-site --out missing_site
