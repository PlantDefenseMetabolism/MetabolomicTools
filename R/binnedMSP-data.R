#' @name binnedMSP
#' @title Example data for \code{MetCirc}: \code{binnedMSP}
#' @description The object \code{binnedMSP} is a \code{matrix}, where rows are 
#' metabolites detected in the tissues sepal (SPL), limb (LIM), anther (ANT) 
#' and style (STY). The columns contain binned m/z values. Entries 
#' contain the intensity (in percent) of a certain metabolite at a 
#' certain m/z value. \code{binnedMSP} is derived from the object \code{tissue} 
#' and \code{compartmentTissue}.
#' @docType data
#' @usage binnedMSP
#' @return \code{matrix}
#' @format \code{matrix}
#' @source 
#' data("idMSMStissueproject", package = "MetCirc")
#' data("idMSMStoMSP", package = "MetCirc")
#' tissueSPL <- compartmentTissue[compartmentTissue[,"SPL"] == TRUE, 1]
#' tissueLIM <- compartmentTissue[compartmentTissue[,"LIM"] == TRUE, 1]
#' tissueANT <- compartmentTissue[compartmentTissue[,"ANT"] == TRUE, 1]
#' tissueSTY <- compartmentTissue[compartmentTissue[,"STY"] == TRUE, 1]
#' 
#' ## truncate tissue
#' tissueSPL <- tissue[tissue[,4] %in% tissueSPL,] 
#' tissueLIM <- tissue[tissue[,4] %in% tissueLIM,]
#' tissueANT <- tissue[tissue[,4] %in% tissueANT,]
#' tissueSTY <- tissue[tissue[,4] %in% tissueSTY,]
#' 
#' ## create msp and combine msp objects of different tissues
#' finalMSP <- convert2MSP(tissueSPL, splitIndMZ = 1, splitIndRT = 2, rt = TRUE)
#' finalMSP <- combine(finalMSP, convert2MSP(tissueLIM, splitIndRT = 2, rt = TRUE))
#' finalMSP <- combine(finalMSP, convert2MSP(tissueANT, splitIndRT = 2, rt = TRUE))
#' finalMSP <- combine(finalMSP, convert2MSP(tissueSTY, splitIndRT = 2, rt = TRUE))
#' 
#' ## create vector with compartments
#' compSPL <- rep("SPL", length(convert2MSP(tissueSPL)))
#' compLIM <- rep("LIM", length(convert2MSP(tissueLIM)))
#' compANT <- rep("ANT", length(convert2MSP(tissueANT)))
#' compSTY <- rep("STY", length(convert2MSP(tissueSTY)))
#' 
#' compartment <- c(compSPL, compLIM, compANT, compSTY)
#' binnedMSP <- binning(msp = finalMSP, tol = 0.01, 
#'                      group = compartment, method = "median")
#' save(binnedMSP, file = "binnedMSP.RData", compress = "bzip2")
#' @author Thomas Naake, \email{thomasnaake@googlemail.com}
NULL  
