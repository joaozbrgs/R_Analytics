#Factor
#'?factor'

#Creating a factor
State <- factor(
    c(
        'IL',
        'NV',
        'TX',
        'AZ',
        'WI',
        'CA'
    )
)

print(State)


#creating levels to sort
study.level <- factor(
    c(
        'High School',
        'PhD',
        'High School',
        'Masters Degree',
        'Bachelors (incomplete)',
        'Masters Degree',
        'Bachelors (complete)',
        'Middle School'
    ),
    levels = c(
        'Middle School',
        'High School',
        'Bachelors (incomplete)',
        'Bachelors (complete)',
        'Masters Degree',
        'PhD'
    ),
    ordered = TRUE
)

print(study.level)

