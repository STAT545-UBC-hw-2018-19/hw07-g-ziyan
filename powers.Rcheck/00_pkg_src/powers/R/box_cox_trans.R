#' Apply Box-Cox transformation
#'
#' This function returns the two-parameter Box-Cox transformations
#' of a positive value
#'
#' @param x Vector to raise to transform.
#' @param a First parameter.
#' @param b Second parameter.
#'
#' @return A vector that is the box-cox trasformation of \code{x}.
#' @examples
#' box_cox_trans(5,0)
#' box_cox_trans(5,4)
#' box_cox_trans(5,2,4)
#' @rdname box_cox_trans
#' @export
box_cox_trans <- function(x, a, b = 0){
    if(a == 0) return(logb(x+b))
    else return(pow(x+b, a)-1)/a
}
