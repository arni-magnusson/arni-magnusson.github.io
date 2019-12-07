eps <- function(file="plot.eps", width=6, height=4, pointsize=10, horizontal=FALSE, onefile=FALSE, paper="special", ...)
########################################################################################################################
###                                                                                                                    #
### Function: eps                                                                                                      #
###                                                                                                                    #
### Purpose:  Open postscript device for EPS output                                                                    #
###                                                                                                                    #
### Args:     file is the output filename                                                                              #
###           width is the device width in inches                                                                      #
###           height is the device height in inches                                                                    #
###           pointsize is the text size in pts                                                                        #
###           horizontal is whether to use landscape layout                                                            #
###           onefile is whether to produce page output, otherwise EPS output                                          #
###           paper specifies the kind of paper to print on                                                            #
###           ... is passed to postscript()                                                                            #
###                                                                                                                    #
### Notes:    EPS options 'horizontal', 'onefile', and 'paper' are explained on the help(postscript) page              #
###                                                                                                                    #
### Returns:  Null, but a graphics device is opened                                                                    #
###                                                                                                                    #
### History:  11 Nov 2010  Arni Magnusson released                                                                     #
###                                                                                                                    #
########################################################################################################################
{
  postscript(file=file, width=width, height=height, pointsize=pointsize, horizontal=horizontal, onefile=onefile,
             paper=paper, ...)
}
