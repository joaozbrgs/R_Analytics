# libraries
library(tidyr)
library(dplyr)

# import data

df.main <- read.csv(
    encoding = 'UTF-8',
    file = 'C:/Users/joao.santos/Downloads/antigo/quantitativo.csv',
    na.strings = c('NA', -1, '-1', '')
)

# Exploratory analysis

# print(str(df.main))
# print(colSums(is.na(df.main)))
# print(head(df.main))

# # Applying treatments

# polo
df.main$polo <- sub(
    'Não Informado', NA, df.main$polo
)

dim_polo <- data.frame(
    polo = unique(df.main$polo),
    reduzido = c('SC','GO','NA','DF','TO','EXP','SP','RS','PR','Nacional','MG','RJ')
)

df.main <- df.main %>%
    left_join(dim_polo, by = 'polo') %>%
    mutate(polo = reduzido)
df.main <- df.main[-19]



# fixing date columns
column_list <- c('dt_inicio_contrato', 'dt_fim_contrato', 'dt_desl_termino')

df.main[column_list] <- lapply(df.main[column_list], function(column){
    column <- as.Date(
        sub(
            '\\s.*|1900-01-01',
            '',
            column
        ),
        format = '%Y-%m-%d'
    )
    column[column == ''] <- NA
    return(column)
})

print(str(df.main))

# print(head(df.main[7:9]))




# df.main$percapta <- as.numeric(df.main$percapta)

# print(View(df.main))














# Define the columns you want to process
columns_to_process <- c("dt_inicio_contrato", "dt_fim_contrato", "dt_desl_termino")

# Apply the transformation to each column in columns_to_process
df.main[columns_to_process] <- lapply(df.main[columns_to_process], function(column) {
  # Remove time portion and replace '1900-01-01' with NA
  column <- as.Date(sub('\\s.*|1900-01-01', '', column), format = '%Y-%m-%d')
  column[column == ''] <- NA
  return(column)
})


