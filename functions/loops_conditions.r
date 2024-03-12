#Loops

#for
for(i in seq(12)){  #note that, unlike python, it starts with 1 and goes to 12 (python would return 0 - 11)
    print(i)
}

#while
i <- 0
while(i <= 1000){
    print(i)
    i = i+1 #i++ didn't work...
}

#Conditions/ Script flow management

#if
score <- 3
if (score >= 6){    #note that correct indentation matters here
    print('Pass')
} else if (score >= 5 && score < 6) {
   print('Second Chance')
} else {
   print('Fail')
}