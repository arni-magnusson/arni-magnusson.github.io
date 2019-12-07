panel.lmfit <- function(x, y, col.line="black", col.points="black", ...)
########################################################################################################################
###                                                                                                                    #
### Function: panel.lmfit                                                                                              #
###                                                                                                                    #
### Purpose:  Panel function to draw a scatterplot with a fitted least-squares line                                    #
###                                                                                                                    #
### Args:     x, y, and ... are passed to panel.xyplot() and panel.lmline()                                            #
###                                                                                                                    #
### Requires: panel.xyplot, panel.lmline                                                                               #
###                                                                                                                    #
### Returns:  Null, but draws a scatterplot panel with line                                                            #
###                                                                                                                    #
### History:  11 Nov 2010  Arni Magnusson released                                                                     #
###                                                                                                                    #
########################################################################################################################
{
  panel.xyplot(x, y, col=col.points, ...)
  panel.lmline(x, y, col=col.line, ...)
}
