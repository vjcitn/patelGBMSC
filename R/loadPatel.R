#' use BiocFileCache discipline to acquire patelGBMSC SummarizedExperiment
#' @param remotePath character(1) identifying remote RDS
#' @note The RDS for the SummarizedExperiment is in an AWS S3 bucket.
#' This function will check local cache for the data and will download
#' to cache if not found.  That download is a one-time operation for
#' any given value of \code{cache}.
#' @examples
#' loadPatel
#' @export
loadPatel = function(remotePath = "https://s3.amazonaws.com/bcfound-sc/patelGeneCount.rds", cache=BiocFileCache()) {
    if (!checkCache_patel(cache)) message("adding RDS to local cache, future invocations will use local image")
    path = bfcrpath(cache, remotePath)
    readRDS(path)
}
    
checkCache_patel = function(cache=BiocFileCache()) {
 allr = bfcinfo(cache)$rname
 "https://s3.amazonaws.com/bcfound-sc/patelGeneCount.rds" %in% allr
}
