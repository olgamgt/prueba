#/bin/bash
/usr/local/cuda/bin/nvcc frustum-pointnets/models/tf_ops/grouping/tf_grouping_g.cu -o tf_grouping_g.cu.o -c -O2 -DGOOGLE_CUDA=1 -x cu -Xcompiler -fPIC

# TF1.2
#g++ -std=c++11 tf_grouping.cpp tf_grouping_g.cu.o -o tf_grouping_so.so -shared -fPIC -I /usr/local/lib/python2.7/dist-packages/tensorflow/include -I /usr/local/cuda-8.0/include -lcudart -L /usr/local/cuda-8.0/lib64/ -O2 -D_GLIBCXX_USE_CXX11_ABI=0

# TF1.4
g++ -std=c++11 frustum-pointnets/models/tf_ops/grouping/tf_grouping.cpp tf_grouping_g.cu.o -o tf_grouping_so.so -shared -fPIC -I /usr/local/lib/python2.7/dist-packages/tensorflow_core/include -I /usr/local/cuda/include -I /usr/local/lib/python3.6/dist-packages/tensorflow_core/include/external/nsync/public -lcudart -L /usr/local/cuda/lib64/ -L/usr/local/lib/python3.6/dist-packages/tensorflow_core/libtensorflow_framework.so.1 -D_GLIBCXX_USE_CXX11_ABI=0
