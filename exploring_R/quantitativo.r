# libraries
library(tidyr)
library(dplyr)

# import data

df.main <- read.csv(
    encoding = 'UTF-8',
    file = 'C:/Users/joao.santos/Downloads/antigo/quantitativo.csv',
    sep = ';',
    dec = ',',
    na.strings = c('NA', -1, '-1', 'Não Informado', '')
)

# Exploratory Analysis

# print(head(df.main))
# print(str(df.main))
# print(dim(df.main))
# print(glimpse(df.main))
# print(View(df.main))

# print(colSums(is.na(df.main)))

# Applying Treatments

df.main$percapta <- as.numeric(df.main$percapta)

df.main$dt_inicio_contrato <- as.Date(
    strsplit(df.main$dt_inicio_contrato, split = ' ')[[1]],
    format = '%Y-%m-%d'
)

df.main$dt_fim_contrato <- as.Date(
    strsplit(df.main$dt_fim_contrato, split = ' ')[[1]],
    format = '%Y-%m-%d'
)

df.main$dt_desl_termino <- as.Date(
    strsplit(df.main$dt_desl_termino, split = ' ')[[1]],
    format = '%Y-%m-%d'
)

df.main$ccusto_reduzido <- as.numeric(substr(df.main$centro_de_custo_codigo, 1, 3))

df.main$tipo_gestao <- sub('Gestao Educacional', 'GE', df.main$tipo_gestao)
df.main$tipo_gestao <- sub('Gestao Completa', 'GC', df.main$tipo_gestao)

df.ccusto <- data.frame(
    cod_ccusto_red = c(
        200,
        201,
        202,
        203,
        204,
        205,
        206,
        207,
        208,
        209,
        210
    ),
    polo = c(
        'NACIONAL',
        'GO',
        'DF',
        'TO',
        'EXP',
        'RS',
        'SC',
        'SP',
        'PR',
        'RJ',
        'MG'
    )
)
df.ccusto$cod_ccusto_red <- as.integer(df.ccusto$cod_ccusto_red)


# Creating organized dataFrames

gc_ge <- c('matricula', 'tipo_gestao')
total.gc_ge <- unique(df.main[gc_ge])

df.gc <- total.gc_ge %>%
    filter(tipo_gestao == 'GC')
df.ge <- total.gc_ge %>%
    filter(tipo_gestao == 'GE')
##
# Bring = uf, dt_ini, dt_fim, dt_desl, percapta, ccusto_red

bring = c('matricula', 'uf_jovem', 'dt_inicio_contrato', 'dt_fim_contrato', 'dt_desl_termino', 'percapta', 'ccusto_reduzido')
common = c('ccusto_reduzido' = 'cod_ccusto_red')

df.gc <- left_join(df.gc, df.main[bring], 'matricula')
df.ge <- left_join(df.ge, df.main[bring], 'matricula')

df.gc <- left_join(df.gc, df.ccusto, by = common)
df.ge <- left_join(df.ge, df.ccusto, by = common)

df.gc <- df.gc %>%
    filter(!is.na(polo))
df.ge <- df.ge %>%
    filter(!is.na(polo))


today <- Sys.Date()
print(today)


# print(dim(df.gc))
# print(dim(df.ge))

# print(str(df.ccusto))

# print(head(df.gc))
# print(head(df.ge))

# print(glimpse(df.ccusto))
# print(head(df.gc))

