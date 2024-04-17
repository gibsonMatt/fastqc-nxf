params.fastqpath = ''

params.outdir = './'

process fastqQC {
	publishDir params.outdir, mode:'copy'
	input: 
	path(reads)

	output:
	path('fastq_report.html')

	script:
	"""
	fastqc $reads
	mv *.html fastq_report.html
	"""
}


workflow {

	fastqQC(file(params.fastqpath))

}