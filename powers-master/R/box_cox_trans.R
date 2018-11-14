#' Apply Box-Cox transformation
#'
#' This function returns the two-parameter Box-Cox transformations
#' of a positive value
#'
#' @param x Vector to raise to transform. And the value should be larger
#' than 0.
#' @param a First parameter.
#' @param b Second parameter.
#'
#' @return A vector that is the box-cox trasformation of \code{x}.
#' @details
#' If you really want to see more, check out the internal \code{\link{pow}}
#' and  \code{\link{log}} function that depends on.
#' @examples
#' box_cox_trans(5,0)
#' box_cox_trans(5,4)
#' box_cox_trans(5,2,4)
#' @rdname box_cox_trans
#' @export
box_cox_trans <- function(x, a, b = 0, plot_it = FALSE){
    if(a == 0) return(logb(x+b))
    else return(pow(x+b, a, plot_it)-1)/a
}
