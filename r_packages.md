## List of potentially relevant packages (LabNPF)


#### [Learning and Teaching R]

* [swirl](https://cran.r-project.org/web/packages/swirl/index.html): Learn R, in R (https://swirlstats.com/)
* [swirlify](https://cran.r-project.org/web/packages/swirlify/index.html): A Toolbox for Writing 'swirl' Courses
* [exams](https://cran.r-project.org/web/packages/exams/index.html): Automatic Generation of Exams in R (http://www.r-exams.org/)

#### [R management]
* [installr](https://cran.r-project.org/web/packages/installr): Using R to Install Stuff on Windows OS (Such As: R, 'Rtools', 'RStudio', 'Git', and More!)
* [pacman](https://cran.r-project.org/web/packages/pacman/): Package Management Tool
  * Usage:
```
    if (!require("pacman")) install.packages("pacman")
    pacman::p_load(package1, package2, package_n)
```

#### [Data input-output (IO)]

* [foreign](https://cran.r-project.org/web/packages/foreign/): Read Data Stored by 'Minitab', 'S', 'SAS', 'SPSS', 'Stata', 'Systat', 'Weka', 'dBase', ...
* [haven](): Can export to SPSS .sav -- write_sav() function
* [readxl](https://cran.r-project.org/web/packages/readxl/): Read Excel Files


#### [Data wrangling & programming functionality]

* [tidyverse](https://cran.r-project.org/web/packages/tidyverse/): : Easily Install and Load the 'Tidyverse' (https://www.tidyverse.org/)
* [broom](https://cran.r-project.org/web/packages/broom/): Convert Statistical Objects into Tidy Tibbles
* [codebook](https://cran.r-project.org/web/packages/codebook/): Automatic Codebooks from Metadata Encoded in Dataset Attributes
* [foreach](https://cran.r-project.org/web/packages/foreach/): Provides Foreach Looping Construct
* [lubridate](https://cran.r-project.org/web/packages/lubridate/): Make Dealing with Dates a Little Easier
* [reshape2](https://cran.r-project.org/web/packages/reshape2/): Flexibly Reshape Data: A Reboot of the Reshape Package
  * [reshape](https://cran.r-project.org/web/packages/reshape/) for more functionality, but slower
* [shiny](https://cran.r-project.org/web/packages/shiny/): Web Application Framework for R


#### [Analysis - Statistics]

* [BayesFactor](https://cran.r-project.org/web/packages/BayesFactor/): Computation of Bayes Factors for Common Designs
* [lme4](https://cran.r-project.org/web/packages/lme4/): Linear Mixed-Effects Models using 'Eigen' and S4
* [effectsize](https://cran.r-project.org/web/packages/effectsize/): Indices of Effect Size (see also https://easystats.github.io/easystats/)
* [metafor](https://cran.r-project.org/web/packages/metafor/): Meta-Analysis Package for R (https://www.metafor-project.org)
* [nlme](https://cran.r-project.org/web/packages/nlme/): Linear and Nonlinear Mixed Effects Models
* [performance](https://cran.r-project.org/web/packages/performance/): Assessment of Regression Models Performance (includes model_check for assumptions)
* [psych](https://cran.r-project.org/web/packages/psych/): Procedures for Psychological, Psychometric, and Personality Research
* [sem](https://cran.r-project.org/web/packages/sem): Structural Equation Models
* [lavaan](https://cran.r-project.org/web/packages/lavaan/): Latent Variable Analysis (https://lavaan.ugent.be/)


#### [Analysis - Information Theoretic]

* [entropy](https://cran.r-project.org/web/packages/entropy/): Estimation of Entropy, Mutual Information and Related Quantities
* [infotheo](https://cran.r-project.org/web/packages/infotheo/): Information-Theoretic Measures


#### [Outputs - Graphics]

* [ggplot2](https://cran.r-project.org/web/packages/ggplot2): Create Elegant Data Visualisations Using the Grammar of Graphics
  * [esquisse](https://cran.r-project.org/web/packages/esquisse/): Explore and Visualize Your Data
  Interactively
  * ggstatsplot
  * ggsignif
  * [metaviz](https://cran.r-project.org/web/packages/metaviz/index.html): Forest Plots, Funnel Plots, and Visual Funnel Plot Inference for Meta-Analysis
* [cairo](https://cran.r-project.org/web/packages/Cairo/index.html): R Graphics Device using Cairo Graphics Library for Creating High-Quality Bitmap (PNG, JPEG, TIFF), Vector (PDF, SVG, PostScript) and Display (X11 and Win32 Output)


#### [Outputs - Formatting]

* [apa](https://cran.r-project.org/web/packages/apa/index.html): Format Outputs of Statistical Tests According to APA Guidelines
* [apaTables](https://dstanley4.github.io/apaTables/articles/apaTables.html): Create output tables in APA Style
* [report](https://cran.r-project.org/web/packages/report/index.html): Automated Reporting of Results and Statistical Models



#### [Neuroimaging - not tested!]

1- AnalyzeFMRI -Functions for I/O, visualisation and analysis of 
functional Magnetic Resonance Imaging (fMRI) datasets stored in the 
ANALYZE or NIFTI format. 

2- fmri - contains R-functions to perform an fmri analysis as described 
in Tabelow, K., Polzehl, J., Voss, H.U., and Spokoiny, V. Analysing fMRI 
experiments with structure adaptive smoothing procedures, NeuroImage, 
33:55-62 (2006).

3- dti - Diffusion Weighted Imaging is a Magnetic Resonance Imaging 
modality, that measures diffusion of water in tissues like the human 
brain. The package contains R-functions to process diffusion-weighted 
data in the context of the diffusion tensor model (DTI). This includes 
the calculation of anisotropy measures and, most important, the 
implementation of our structural adaptive smoothing algorithm as 
described in K. Tabelow, J. Polzehl, V. Spokoiny, and H.U. Voss, 
Diffusion Tensor Imaging: Structural Adaptive Smoothing, Neuroimage 
39(4), 1763-1773 (2008).

4 - https://erpinr.org/

5 - https://cran.r-project.org/web/packages/erpR/erpR.pdf


---

Author: Fernando Ferreira-Santos (http://ferreira-santos.eu)

Date created: 2023-01-08
Updated: on latest commit!
