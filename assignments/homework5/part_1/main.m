



A=[0 0 0 0 0 0 0
   0 0 1 1 0 0 0
   0 0 0 1 0 0 0
   0 0 0 1 1 0 0
   0 0 1 1 1 1 0
   0 0 1 1 1 0 0
   0 1 0 1 0 1 0
   0 0 0 0 0 0 0];


result_of_a = Dilation(A, [1 1 1], 1, 1)

result_of_b = Erosion(A, [1 1 1], 1, 1)

result_of_c = Dilation(A, [1 1; 0 1], 1, 2)

result_of_d = Erosion(A, [1 1; 0 1], 1, 2)

result_of_e_1 = Opening(A, [1 1 1], 1, 1)

result_of_e_2 = Opening(A, [1 1; 0 1], 1, 2)

result_of_f_1 = Closing(A, [1 1 1], 1, 1)

result_of_f_2 = Closing(A, [1 1; 0 1], 1, 2)