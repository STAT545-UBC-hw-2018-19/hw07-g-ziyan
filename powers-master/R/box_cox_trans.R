#' Apply Box-Cox transformation
#'
#' This function returns the two-parameter Box-Cox transformation or
#' inverse Box-Cox transformation of a vector.
#'
#' @param x Vector to raise to transform. And the value should be larger
#' than -b.
#' @param a Power parameter.
#' @param b Shift parameter. 0 by default.
#' @param plot_it Display a plot of \code{x} vs the output? Use logical.
#' \code{FALSE} by default.
#'
#' @return A vector that is the box-cox trasformation or inverse
#' box-cox trasformation of \code{x}.
#' @details
#' If you really want to see more, check out the internal \code{\link{pow}}
#' and  \code{\link{log}} function that depends on.
#' @examples
#' box_cox_trans(5,0)
#' box_cox_trans(5,4)
#' box_cox_trans(5,2,4)
#' inv_box_cox_trans(5,2,4,plot_it=True)
#' @rdname box_cox_trans
#' @export
box_cox_trans <- function(x, a, b = 0, plot_it = FALSE){
    if(any(x <= -b))
        stop("x is out of range, which should be larger than -b.")
    if(a == 0) return(logb(x+b))
    else return(pow(x+b, a, plot_it)-1)/a
}

#' @rdname box_cox_trans
#' @export
inv_box_cox_trans <- function(x, a, b = 0, plot_it = FALSE){
    if(any(x <= -b))
        stop("x is out of range, which should be larger than -b.")
    if(a != 0) res = ((a*(x+b) + 1)^(1/a))
    else res = (exp(x+b))
    if (plot_it) print(ggplot2::qplot(x, res))
    return(res)
}

