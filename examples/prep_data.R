# Prep data for the examples
# M. Espe
# Mar 2018

data(mtcars)

mtcars$make = factor(sapply(strsplit(rownames(mtcars), " "), "[[", 1))

data_list = list(y = mtcars$mpg,
                 X = model.matrix(~ -1 + cyl + disp + hp + wt, data = mtcars),
                 N = nrow(mtcars))
data_list$K = ncol(data_list$X)
