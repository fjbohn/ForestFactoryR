#' copy and addpated C++ files of the forest factory scn into github
#' @description copy and addpated C++ files of the forest factory scn into github
#'
#' @param svnPath characterstring - svnPath
#' @param githubPath characterstring - githubPath


#githubPath <- "C:/Daten/ownCloud/Projects/H2F3-Paper/ForestFactoryR/src/"
#svnPath <- "C:/Daten/FORMIND-TRUNK/formind-model/src/"

addLine <- function(file, githubPath){
  line <- c("#include <Rcpp.h>", "using namespace Rcpp;")
  lines <- readLines(file)
  lines <- c(line, lines)
  writeLines(lines, paste0(githubPath, file))
}

copyFiles2Project <- function(svnPath, githubPath){
  listFiles <- list.files(path = svnPath, pattern = "\\.h$")
  listFiles <- c(listFiles, list.files(path = svnPath, pattern = "\\.cpp$"))
  setwd(svnPath)
  dataList<-lapply(listFiles, addLine, githubPath = githubPath )
}

copyFiles2Project(svnPath, githubPath)
