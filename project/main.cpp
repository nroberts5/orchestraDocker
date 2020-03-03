#include <iostream>
#include <MDArray/LinearAlgebra.h>
#include <MDArray/FileIO.h>

using namespace std;
using namespace MDArray;

template <class T, int r>
void saveMDArray(MDArray::Array<T,r>& array, std::string name, std::ofstream& mfile)
{
    WriteMda(array,name+".bin");
    mfile<<"FID = fopen('"<<name+".bin'"<<");"<<endl;
    mfile<<name<<" = fread(FID,"<<array.numElements()<<", 'double');"<<endl;
    mfile<< name <<"= reshape("<<name<<","<<array.shape()<<");"<<endl;
}

int main() {
   cout<<"Hello from Docker Container!"<<endl;
   MDArray::IntVector x(5); x = 1, 2, 3, 4, 5;
   cout<<x<<endl; 


    return 0;
}