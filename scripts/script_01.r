#Set the working directory to the parent folder
data <- read.csv(
    fileEncoding = 'latin1',
    file = './datasets/viagens_-_portal_da_transparencia(2023)/2023_Viagem.csv',
    sep = ';',
    dec = ','
)

print(View(data))   # This is a demanding function

