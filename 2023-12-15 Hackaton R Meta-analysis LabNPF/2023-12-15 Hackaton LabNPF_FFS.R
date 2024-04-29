# 1. Initialize ####

## Package para gestão de packages: pacman
library(pacman)

## Carregar package de meta-análise "metafor" (auto-instala se for necessário)
p_load(metafor)


## Mostrar versões em uso do R e do package metafor
R.Version()
packageVersion("metafor")

## Abrir a documentação de ajuda do package metafor
help(metafor)




# 2. Import data #### 

## Definir pasta/diretório de trabalho
setwd("[path_folder]")

## Abrir ficheiro da base de dados
##     Disponível em https://github.com/LabNPF/LabNPF_R/blob/main/2023-12-15%20Hackaton%20R%20Meta-analysis%20LabNPF/P200_hackaton.csv
madata <- read.csv("[filename]")


## Visualizar dados
print(madata)




# 3. Meta-analysis (and diagnostics) ####
meta <- rma(data=madata, yi=d, sei=se, slab=name)

summary(meta) # show summary of results
forest(meta)  # forest plot
funnel(meta)  # funnel plot
regtest(meta) # Publication bias regression test



  
# 4. Heterogeneity analysis ####
meta_mod <- rma(data=madata, yi=d, sei=se, slab=name, mods=medication)




