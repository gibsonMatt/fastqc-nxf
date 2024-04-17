params.fastqpath = ''

params.outdir = './'

process fastqQC {
	publishDir params.outdir, mode:'copy'
	input: 
	path(reads)

	output:
	path('*.html')

	script:
	"""
	fastqc $reads
	"""
}


workflow {

	fastqQC(file(params.fastqpath))

}