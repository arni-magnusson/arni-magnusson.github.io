.First <- function()
{
  require(gdata, quiet=TRUE)

  attach(NULL, name="Toolbox")
  load("~/r/toolbox/toolbox.RData", envir=as.environment("Toolbox"))
  .libPaths(sort(.libPaths()))  # user library in first slot
  options(browser=if(.Platform$OS.type=="windows") NULL else "firefox")  # quit gracefully
  options(continue="  ")
  options(editor=if(.Platform$OS.type=="windows") "emacs" else "/usr/bin/emacs --no-site-file")  # write
  options(help_type="html")
  options(pager=if(.Platform$OS.type=="windows") "runemacs" else "/usr/lib64/R/bin/pager")  # hide
  options(repos=c("http://mirrors.dotsrc.org/cran","http://R-Forge.R-project.org","http://www.stats.ox.ac.uk/pub/RWin"))
  options(stringsAsFactors=FALSE)
  options(width=150)

  Autoload <- function(name,package) if(!exists(name)) autoload(name,package)

  ## Applied linear regression
  Autoload("delta.method"           , "alr3")  # point estimate and se for derived par like SSTopt
  Autoload("inf.index"              , "alr3")  # plot influence, leverage, outliers
  Autoload("outlier.t.test"         , "alr3")  # similar to outlier.test, but reports multiple outliers
  Autoload("powtran"                , "alr3")  # transform Y
  Autoload("residual.plots"         , "alr3")  # Pearson res~X and res~Y

  ## Plots
  Autoload("bagplot"                , "aplpack")  # 2d scatterplot
  Autoload("faces"                  , "aplpack")  # multivariate faces
  Autoload("spin3R"                 , "aplpack")  # 3d scatter

  ## Nonlinear optimization
  Autoload("spg"                    , "BB")  # nlm optimizer

  ## Likelihood
  Autoload("dfp"                    , "Bhat")  # nlm optimization
  Autoload("mymcmc"                 , "Bhat")  # simulate posterior
  Autoload("newton"                 , "Bhat")  # nlm optimization

  ## Bootstrap
  Autoload("glm.diag"               , "boot")  # lm diagnostics: stats

  ## Applied regression
  Autoload("av.plots"               , "car")  # added var plot
  Autoload("ceres.plots"            , "car")  # partial res plot
  Autoload("cr.plots"               , "car")  # partial res plot
  Autoload("leverage.plots"         , "car")  # leverage plot
  Autoload("ncv.test"               , "car")  # non-constant variance test (heteroskedasticity)
  Autoload("outlierTest"            , "car")  # similar to outlier.t.test, but supports complex models
  Autoload("scatterplot"            , "car")  # 2d scatter
  Autoload("scatterplot.matrix"     , "car")  # multivariate scatter

  ## MCMC diagnostics
  Autoload("autocorr"               , "coda")  # autocorrelation
  Autoload("autocorr.plot"          , "coda")  # MCMC diagnostics: thinning
  Autoload("cumuplot"               , "coda")  # MCMC diagnostics: convergence
  Autoload("densplot"               , "coda")  # MCMC posterior
  Autoload("geweke.diag"            , "coda")  # MCMC test
  Autoload("heidel.diag"            , "coda")  # MCMC test
  Autoload("mcmc"                   , "coda")  # create mcmc object
  Autoload("traceplot"              , "coda")  # MCMC diagnostics: convergence

  ## Correlation plot
  Autoload("ellipse"                , "ellipse")  # two-parameter confidence region
  Autoload("plotcorr"               , "ellipse")  # plot correlation matrix

  ## Greg Warnes's toolkit
  ## Autoload("Args"                , "gdata")   # arnima (already loaded)
  ## Autoload("env"                 , "gdata")   # arnima (already loaded)
  ## Autoload("is.what"             , "gdata")   # arnima (already loaded)
  ## Autoload("keep"                , "gdata")   # arnima (already loaded)
  ## Autoload("ll"                  , "gdata")   # arnima (already loaded)
  Autoload("balloonplot"            , "gplots")  # 3d symbol
  Autoload("hist2d"                 , "gplots")  # 3d symbol
  Autoload("plotCI"                 , "gplots")  # 2d error bars
  Autoload("plotmeans"              , "gplots")  # 2d error bars
  Autoload("rich.colors"            , "gplots")  # arnima
  Autoload("logit"                  , "gtools")  # logit(p)
  Autoload("inv.logit"              , "gtools")  # inv.logit(alpha)

  ## Hafro
  Autoload("apply.shrink"           , "geo")  # aggregate
  Autoload("apply.shrink.dataframe" , "geo")  # aggregate
  Autoload("geoplot"                , "geo")  # map
  Autoload("pre2s"                  , "geo")  # database
  Autoload("s2pre"                  , "geo")  # database
  Autoload("sqlcommand"             , "geo")  # database

  ## GMT
  Autoload("deg2num"                , "gmt")  # arnima
  Autoload("geodist"                , "gmt")  # arnima

  ## Hexagonal bin plot
  Autoload("hexbin"                 , "hexbin")  # 3d symbol

  ## Hints
  Autoload("hints"                  , "hints")  # help

  ## Frank Harrell's toolkit
  Autoload("bpplot"                 , "Hmisc")  # 1d boxplot
  Autoload("contents"               , "Hmisc")  # summary
  Autoload("datadensity"            , "Hmisc")  # multivariate: hist and jitter
  Autoload("describe"               , "Hmisc")  # summary
  Autoload("hist.data.frame"        , "Hmisc")  # multivariate: hist
  Autoload("panel.xYplot"           , "Hmisc")  # 2d error bars

  ## Lattice graphics
  Autoload("barchart"               , "lattice")  # 1d bar plot
  Autoload("bwplot"                 , "lattice")  # 1d boxplot
  Autoload("cloud"                  , "lattice")  # 3d scatter
  Autoload("contourplot"            , "lattice")  # 3d contour
  Autoload("densityplot"            , "lattice")  # 1d empirical pdf
  Autoload("dotplot"                , "lattice")  # 1d dot plot
  Autoload("histogram"              , "lattice")  # 1d hist
  Autoload("levelplot"              , "lattice")  # 3d contour
  Autoload("parallel"               , "lattice")  # multivariate parallel
  Autoload("splom"                  , "lattice")  # multivariate scatter
  Autoload("stripplot"              , "lattice")  # 1d by factor
  Autoload("trellis.device"         , "lattice")  # device
  Autoload("wireframe"              , "lattice")  # 3d surface
  Autoload("xyplot"                 , "lattice")  # 2d scatterplot

  ## Mixed effects
  Autoload("glmer"                  , "lme4") # generalized linear mixed effects
  Autoload("lmer"                   , "lme4") # linear mixed effects
  Autoload("nmler"                  , "lme4") # nonlinear mixed effects

  ## Geographic maps
  Autoload("map"                    , "maps")  # map

  ## Venables and Ripley toolkit
  Autoload("as.fractions"           , "MASS")  # fractions: 1.333<->4:3
  Autoload("boxcox"                 , "MASS")  # transform: ^ and log
  Autoload("fitdistr"               , "MASS")  # estimate beta/gamma/negbinom
  Autoload("glm.nb"                 , "MASS")  # glm neg binom family
  Autoload("glmmPQL"                , "MASS")  # glmm, requires lme4
  Autoload("logtrans"               , "MASS")  # transform: log(y+alpha)
  Autoload("parcoord"               , "MASS")  # multivariate: parallel

  ## MCMC
  Autoload("metrop"                 , "mcmc")  # simulate posterior

  ## Local regression
  Autoload("loess"                  , "modreg")  # loess smoother
  Autoload("loess.smooth"           , "modreg")  # loess lines
  Autoload("scatter.smooth"         , "modreg")  # loess plot

  ## Multivariate analysis
  Autoload("biplot"                 , "mva")  # package:MASS doesn't load without this

  ## Nonlinear optimization
  Autoload("nls"                    , "nls")  # nlm optimizer

  ## Mixed effects
  Autoload("lme"                    , "nlme")  # linear mixed effects model
  Autoload("nlme"                   , "nlme")  # nonlinear mixed effects model

  ## PBS toolkit
  Autoload("pickCol"                , "PBSmodelling")  # choose color from RGB palette
  Autoload("plotBubbles"            , "PBSmodelling")  # 3d symbol

  ## 3D plots
  Autoload("plot3d"                 , "rgl")  # 3d scatter
  Autoload("persp3d"                , "rgl")  # 3d surface

  ## 3D scatterplot
  Autoload("scatterplot3d"          , "scatterplot3d")  # 3d scatter

  ## Nonlinear optimization
  Autoload("mle"                    , "stats4")  # nlm optimizer

  ## Package development
  Autoload("Rdindex"                , "tools")  # write index of functions
  Autoload("dependsOnPkgs"          , "tools")  # which local packages depend on this one
  Autoload("file_path_sans_ext"     , "tools")  # filename prefix
  Autoload("write_PACKAGES"         , "tools")  # create repository

  ## Violin plot
  Autoload("vioplot"                , "vioplot")  # 1d boxplot
}

.Last <- function()
{
  ## Backup user workspace
  if(getwd() == path.expand("~"))
    file.rename(".RData", ".rback")

  ## Backup and save toolbox
  file.rename("~/r/toolbox/toolbox.RData", "~/r/toolbox/toolbox.rback")
  save(list=ls("Toolbox",all=TRUE), file="~/r/toolbox/toolbox.RData", envir=as.environment("Toolbox"), compress=TRUE)

  ## Delete .First, .Last, and some common residual objects
  suppressWarnings(rm(.First, .Last,
                      worldMapEnv, .Last.projection, .map.range,  # map
                      .rdired.objects, pos=1))                    # r-dired

  ## If you remove .Last during an R session, read this before quitting:
  ##   Overwrite default workspace without backing up? (possibly bad)
  ##   Discard changes to toolbox? (possibly bad)
  ##   Allow residual objects like worldMapEnv to remain in workspace? (always ok)
  ## In short: to save .rback and toolbox, just copy this .Last function into your workspace now
}
