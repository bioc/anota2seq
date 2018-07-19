\docType{methods}
\name{anota2seqGetDirectedRegulations}
\alias{anota2seqGetDirectedRegulations}
\alias{anota2seqGetDirectedRegulations,Anota2seqDataSet-method}
\title{Retrieve output for analyzes stored in the Anota2seqDataSet}
\usage{
anota2seqGetDirectedRegulations(object, getRegMode= "all",getRVM = TRUE)

\S4method{anota2seqGetDirectedRegulations}{Anota2seqDataSet}(object, getRegMode = "all", getRVM = TRUE)
}
\arguments{
\item{object}{An Anota2seqDataSet}

\item{getRegMode}{A character string that can be "all","translation" or "buffering".}

\item{getRVM}{TRUE or FALSE indicating whether the RVM output be retrieved. 
Default is TRUE. NOTE: the output of anota2seqAnalyze (accessed with output
= "full") is available both with RVM (getRVM = TRUE) and without RVM (getRVM = 
FALSE). However, when RVM was set to TRUE, respectively FALSE, in the 
anota2seqRun or anota2seqSelSigGenes functions, all subsequent filtering is 
done on the RVM, respectively no-RVM, output.}
}
\value{

Returns a list of gene identifiers for each contrast and regulatory mode separated by the direction of their apvEff.

}
\description{
The function is used to retrieve a list of directed regulations for all regulatory modes or translation and buffering regulatory modes seperately. Each regulatory mode is split into up and down regulated based on the sign of the apvEff column in the anota2seqSelSigGenes or anota2seqRegModes output.
}
\details{
This function is used to separate the output of anota2seqSelSigGenes or anota2seqRegModes for each regulatory mode into up and down regulated mRNAs. A list of directed regulations for all regulatory modes, i.e. translation, buffering and mRNA abundance can be retrieved using getRegMode parameter set to all, for this option anota2seqRegModes needs to be run on the Anota2seqDataSet. Alternatively, it is possible to retrieve directed regulations for translation and buffering separately by providing the appropriate getRegMode parameter, i.e translation or buffering. For this option depending on whether anota2seqSelSigGens or anota2seqRegModes has been run previously on the Anota2seqDataSet, the returned list will be filtered additionally based on the "singleRegMode"" column (see \link{anota2seqRegModes}).
}
\examples{
# Initialize the Anota2seqDataSet
Anota2seqDataSet <- anota2seqDataSetFromMatrix(
    dataP = anota2seq_data_P[1:100,],
    dataT = anota2seq_data_T[1:100,],
    phenoVec = anota2seq_pheno_vec,
    dataType = "RNAseq",
    normalize = TRUE)
# Perform analysis of changes in translational efficiency leading to altered 
# protein levels
Anota2seqDataSet <- anota2seqAnalyze(Anota2seqDataSet, analysis = "translation",
                                     useProgBar = FALSE)

# Filter
Anota2seqDataSet <- anota2seqSelSigGenes(Anota2seqDataSet, selContrast = 1,
                                         maxPAdj = .2, analysis = "translation")

# Get output for analysis of changes in translational efficiency leading to
# altered protein levels separated into up and down regulated mRNAs
translationResultsDirected <- anota2seqGetDirectedRegulations(Anota2seqDataSet,
                                  getRegMode= "translation",
                                  getRVM = TRUE)



}
\seealso{

\link{anota2seqRun}, 
  \code{\link{anota2seqAnalyze}}, \code{\link{anota2seqSelSigGenes}}, 
  \code{\link{anota2seqRegModes}}, \code{\link{anota2seqGetOutput}}
}
